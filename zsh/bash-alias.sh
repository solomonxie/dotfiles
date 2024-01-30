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
#alias less="zless -N"

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -v -I --preserve-root'

alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

alias SO="source ~/.zshrc"


#######################################################################
#                                 Vim                                 #
#######################################################################
# [[ -e $(command -v nvim) ]] && alias vim="nvim" && alias vimdiff="nvim -d"
alias vi="vi -u NONE -N"
alias ":e"="vim"
alias vimprofiling="vim --startuptime /tmp/startup.log +q && vim /tmp/startup.log"
alias viprofiling="/usr/bin/vim --startuptime /tmp/startup.log +q && vim /tmp/startup.log"

#######################################################################
#                           CONFIG PROJECTS                           #
#######################################################################
alias zshrc="vim ~/myconf/dotfiles/zsh/zshrc-mac.zsh"
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
alias gp="git pub"
alias ga="git add ."
alias gcp="git add .; git quickcommit; git pub"
alias gcl="git clone"
# alias diff=vimdiff
alias work="vim -S .git/work.vim"
alias lg="lazygit"

alias gitrc="vim ~/myconf/dotfiles/etc/git/gitconfig.ini"


#######################################################################
#                               DOCKER                                #
#######################################################################
alias gitbook='docker run -it --name gitbook --rm -v "$PWD":/gitbook -p 4000:4000 billryan/gitbook gitbook'
#alias docker=podman
#alias docker-compose=podman-compose

#######################################################################
#                               PYTHON                                #
#######################################################################
alias ju="~/virtualenv/conda/bin/jupyter notebook"
alias ipy="ipython"
alias py="PYTHONPATH=. python"
alias pt="PYTHONPATH=. pytest"
alias virpy="PYTHONPATH=. .git/venv/bin/python"
alias webdav="python3 -m http.server 7000"
alias ipdb="python3 ~/myconf/dotfiles/python/ipdb_debugger.py"
alias pudb="python3 ~/myconf/dotfiles/python/pudb_debugger.py"
alias load="python3 ~/myconf/dotfiles/python/read_data.py"
alias vir="source .git/venv/bin/activate"

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

alias keymap="bash $HOME/myconf/dotfiles/etc/macos/remap_external_keyboard_60keys.sh"

#######################################################################
#                         CLI TOOLS/COMMANDS                          #
#######################################################################
# PostgreSQL clients
# if [ -x $(command -v pgcli) ]; then
#     alias psql="pgcli"
# elif [ -x /Applications/Postgres.app/Contents/Versions/latest/bin/psql ];then
#     alias psql="/Applications/Postgres.app/Contents/Versions/latest/bin/psql"
# fi

[[ $(type autojump 2>&1) ]] && alias cdj="autojump"

# [[ -x $(command -v bat) ]] && alias cat="bat"

#######################################################################
#                         CUSTOM FUNCTIONS                            #
#######################################################################
# >> REF: zsh/bash-functions.sh
[[ $(type describe_file 2>&1) ]] && alias describe="describe_file"; alias des="describe_file"
[[ $(type preview_file 2>&1) ]] && alias preview="preview_file"

#######################################################################
#                            TMUX RELATED                             #
#######################################################################
alias ptitle="printf '\033]2;%s\033\\'"  # Set Tmux Pane title
#alias tmux="TERM=screen-256color-bce tmux"
# Please do not Overwite the `title` command/function
