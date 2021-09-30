#################################################################################
# %n -> user name
# %F{51}% -> set color for the following components (need a space after it)
# %1~ -> current working directory
# %. -> current directory
# {2} -> green
# {51} -> blue
#################################################################################

# export PROMPT='%n%F:%F{51}%~ $%f '  # bash like
# export PROMPT='%F{51}$%f '  # Folder only
# export PROMPT='[%n] %F{2}%~ $ '
# export PROMPT='%F{51}%~ $ '
# export PROMPT='%F{51}% %. %F{2}% $ '

export GIT_ROOT=`git rev-parse --show-toplevel ||true`
export GIT_BRANCH=`git rev-parse --abbrev-ref HEAD ||true`
git_info="git:(${GIT_BRANCH})"
export PROMPT="%F{51}% %. %F{10}% ${git_info} "

# export PS1="%1~ $ "
# export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# REF: https://www.themoderncoder.com/add-git-branch-information-to-your-zsh-prompt/
# --> very slow
# autoload -Uz vcs_info
# precmd() {vcs_info}
# zstyle ':vcs_info:git:*' formats '<%b>'
# setopt PROMPT_SUBST
# PROMPT='%F{2}% ${vcs_info_msg_0_} $ '
