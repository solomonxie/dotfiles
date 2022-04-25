#! zsh

# =======AUTO INJECT envfile=======
# REF: https://thoughtbot.com/blog/run-a-command-every-time-you-change-directories-in-zsh
_inject_envfile() {
    local fpath
    fpath=$1
    if [[ -e "$fpath" ]];then
        for env in $(grep -v '^#' $fpath); do
            export ${env} > /dev/null
        done
        echo "injected env: ${fpath}"
    fi
}

_inject_project_venv() {
    if [ -e "${PWD}/.git/venv/bin" ];then
        export PATH="${PWD}/.git/venv/bin:$PATH"
        echo "ADDED .git/venv/bin to PATH"
    fi
}

_inject_local() {
    _inject_envfile envfile
    _inject_envfile envfile-local
    # _inject_project_venv
}

#!!! OVERRIDE ZSH BUILT-IN FUNCTION, WILL BE EXECUTED AT EVERY DIR CHANGE===>
chpwd() { _inject_local }

_execute_at_initial_dir() { _inject_local }

_execute_at_initial_dir  # EXECUTE AT BEGINNING OF SHELL
#!!! OVERRIDE ZSH BUILT-IN COMMAND, WILL BE EXECUTED AT EVERY DIR CHANGE===>
# cd () { builtin cd "$@" && chpwd; }
