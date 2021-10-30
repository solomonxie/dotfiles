##################################################
#                 _    _ _                       #
#                / \  | (_) __ _ ___             #
#               / _ \ | | |/ _` / __|            #
#              / ___ \| | | (_| \__ \            #
#             /_/   \_\_|_|\__,_|___/            #
#                                                #
##################################################

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
alias zshrc="vim ~/myconf/dotfiles/zsh/zshrc-mac.sh"
alias vimrc="vim ~/myconf/dotfiles/vim/nvimrc.vim"
alias tmuxrc="vim ~/myconf/dotfiles/tmux/tmux.conf"
alias bashrc="vim ~/.bashrc"
alias rangerrc="vim ~/.config/ranger/rc.conf"
#alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
# alias muttrc="vim -S ~/myconf/dotfiles/vim/sessions/muttrc.vim"
alias tigrc="vim ~/.tigrc"
# alias vimchanges="vim $(git status --porcelain | awk '{print $2}')"
# alias snippets="vim -S ~/myconf/dotfiles/vim/sessions/snippets.vim "


#######################################################################
#                               NETWORK                               #
#######################################################################
alias proxy='export all_proxy=http://127.0.0.1:1080'
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
alias gl="git log"
alias gdh="git diff"
alias gsh="git stash"
alias gco="git checkout"
alias gsc="git sync"
alias gcp="git add .; git quickcommit; git pub"
alias gcl="git clone"
alias diff=vimdiff
alias work="vim -S .git/work.vim"

alias gitrc="vim ~/myconf/dotfiles/etc/git/gitconfig.ini"


#######################################################################
#                               DOCKER                                #
#######################################################################
alias gitbook='docker run -it --name gitbook --rm -v "$PWD":/gitbook -p 4000:4000 billryan/gitbook gitbook'


#######################################################################
#                               PYTHON                                #
#######################################################################
alias venv2="source ~/virtualenv/venv2/bin/activate"
alias venv3="source ~/virtualenv/venv3/bin/activate"
alias venv-ju="source ~/virtualenv/venv-ju/bin/activate"
alias venv-nvim="source ~/virtualenv/venv-ju/bin/activate"
alias ju="~/virtualenv/venv-ju/bin/jupyter notebook"
alias ipy="ipython"
alias webdav="python3 -m http.server 7000"
# [[ -e ~/virtualenv/venv/bin/python ]] && alias python="~/virtualenv/venv/bin/python"
# [[ -e ~/virtualenv/venv/bin/pip ]] && alias pip="~/virtualenv/venv/bin/pip"

#######################################################################
#                          MAC APPLICATIONS                           #
#######################################################################
if [[ $(uname) == "Darwin" ]]; then
    # alias sub="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
    # alias vsc="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
    alias sub="open -a 'Sublime Text'"
    alias code="open -a 'Visual Studio Code'"
    alias typora="open -a 'Typora'"
    alias chrome="open -a Google\ Chrome"
    alias safari="open -a Safari"
    # alias brew="HOMEBREW_NO_AUTO_UPDATE=1 brew"
    alias ibrew="arch -x86_64 /usr/local/bin/brew"
fi


#######################################################################
#                         CLI TOOLS/COMMANDS                          #
#######################################################################
# PostgreSQL clients
# if [ -x $(command -v pgcli) ]; then
#     alias psql="pgcli"
# elif [ -x /Applications/Postgres.app/Contents/Versions/latest/bin/psql ];then
#     alias psql="/Applications/Postgres.app/Contents/Versions/latest/bin/psql"
# fi

[[ -x $(command -v autojump) ]] && alias cdj="autojump"

# [[ -x $(command -v bat) ]] && alias cat="bat"

#######################################################################
#                            TMUX RELATED                             #
#######################################################################
alias ptitle="printf '\033]2;%s\033\\'"  # Set Tmux Pane title
#alias tmux="TERM=screen-256color-bce tmux"
# Please do not Overwite the `title` command/function
