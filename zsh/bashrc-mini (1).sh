#! bash
export EDITOR=vim

#######################################################################
#                        ENVIRONMENT VARIABLES                        #
#######################################################################
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_PAPER=en_US.UTF-8
export LC_NAME=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export LS_COLORS='di=1;34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# Python
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/virtualenv/venv2/bin:$PATH"
export PATH="$HOME/virtualenv/venv/bin:$PATH"

#######################################################################
#                            FOR BUILT-IN                             #
#######################################################################
alias l='ls -l'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias la='ls -A'
alias lsa='ls -harl'
alias lsd='ls -lah -d */'
alias lah="ls -lah"
alias please="sudo"

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -I --preserve-root'

alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'


#######################################################################
#                                 Vim                                 #
#######################################################################
# [[ -e $(command -v nvim) ]] && alias vim="nvim" && alias vimdiff="nvim -d"
alias vi="vi --noplugin"


#######################################################################
#                           CONFIG PROJECTS                           #
#######################################################################
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias tmuxrc="vim ~/.tmux.conf"
alias bashrc="vim ~/.bashrc"
# alias vimchanges="vim $(git status --porcelain | awk '{print $2}')"

#######################################################################
#                               NETWORK                               #
#######################################################################
alias proxy='export all_proxy=http://127.0.0.1:1061'
alias unproxy='unset all_proxy'
alias myip="curl https://httpbin.org/ip"
alias hosts='sudo vim /etc/hosts'

#alias you="youtube-dl -civw --proxy "socks5://127.0.0.1:1086" -f best/mp4 --write-sub "
alias you="youtube-dl"
alias yourc="vim ~/.config/youtube-dl/config"
#alias fzf="~/.fzf/bin/fzf --height 40%"
#alias vfzf="vim $(fzf)"
#alias dfzf="cd $(sh 'find * -type d | fzf')"

alias wgetwholesite="wget -r -p -np -k"
alias wgetkeep="wget -x"


#######################################################################
#                                 GIT                                 #
#######################################################################
alias gs="git status"
alias gc="git commit"
alias gac="git add . && git commit"
# alias gd="git diff --word-diff=plain"
alias gd="git diff"
alias gdh="git diff"
alias gsh="git stash"
alias gco="git checkout"
alias gsc="git sync"
alias gcp="git add .; git quickcommit; git pub"
alias gcl="git clone"
alias diff=vimdiff

alias gitrc="vim ~/.gitconfig"
alias vir="source .git/venv/bin/activate"


#######################################################################
#                              FUNCTIONS                              #
#######################################################################

kgrep() {
    keywords=$1
    if [ -z "$keywords" ];then
        echo "ERROR: MISSING PROCESS NAME..."
        return 128
    fi
    pids="$(ps aux |grep $keywords |grep -v grep |awk '{print $2}' |xargs)"
    echo "[$keywords]: $pids"
    [ $pids == "" ] && return 0
    echo "Kill above processes? (y/n) "
    read answer
    [ $answer == "y" ] && echo $pids |xargs kill -9
}
alias pskill=kgrep

port2proc() {
    port=$1
    lsof -i :$port |awk '{print $2}' |tail -n +2
}


# =======AUTO INJECT envfile=======
# REF: https://thoughtbot.com/blog/run-a-command-every-time-you-change-directories-in-zsh
_inject_envfile() {
    fpath=$1
    if [ -e "$fpath" ];then
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
cd () { builtin cd "$@" && chpwd; }


# # ========DELETE WORD BACKWARDS BY CTRL-W============
# stty werase undef
# bind '\C-w:unix-filename-rubout'
