#! zsh

# =======AUTO INJECT envfile=======
# REF: https://thoughtbot.com/blog/run-a-command-every-time-you-change-directories-in-zsh
_inject_envfile() {
    local fpath
    fpath=$1
    if [[ -e "$fpath" ]];then
        export $(grep -v '^#' $fpath | xargs) > /dev/null
        echo "injected env: ${fpath}"
    fi
}
chpwd() {
    #!!! OVERRIDE ZSH BUILT-IN FUNCTION, WILL BE EXECUTED AT EVERY DIR CHANGE===>
    _inject_envfile envfile
    _inject_envfile envfile-local
}
_execute_at_initial_dir() {
    _inject_envfile envfile
    _inject_envfile envfile-local
}
_execute_at_initial_dir  # EXECUTE AT BEGINNING OF SHELL
#!!! OVERRIDE ZSH BUILT-IN COMMAND, WILL BE EXECUTED AT EVERY DIR CHANGE===>
# cd () { builtin cd "$@" && chpwd; }
