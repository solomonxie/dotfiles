# MAINTAINER: Solomon Xie <solomonxiewise@gmail>
#
# Description: Additional configs for zshrc, which aren't good for public.
#
#
#
# ==== ALIAS ====

# Builtin Utils
alias lah="ls -lah"
alias please="sudo"

# Program replacements
alias vim="nvim"
alias vi="vi --noplugin"
alias rec="asciinema rec"
alias m="macdown"

# RCs, Config files
alias zshrc="vim ~/dotfiles/zsh/zshrc-mac.sh"
alias zshrc0="vim ~/.zshrc"
alias zshrc2="vim ~/dotfiles/zsh/alias-mac.sh"
alias zshrc3="vim ~/dotfiles/zsh/themes.sh"
alias vimrc="vim -S ~/dotfiles/vim/workspace.vim"
#alias vimrc="vim ~/dotfiles/vim/vimrc"
#alias vimrc2="vim ~/dotfiles/vim/vimrc-plugins"
#alias vimrc3="vim ~/dotfiles/vim/vimrc-keymappings"
#alias vimrc4="vim ~/dotfiles/vim/vimrc-ui"
#alias nvimrc="vim ~/dotfiles/vim/init.vim"
alias nvimrc="vim -S ~/dotfiles/vim/workspace.vim"
alias tmuxrc="vim ~/dotfiles/tmux/tmux.conf"
alias bashrc="vim ~/.bashrc"
alias gitrc0="vim ~/.gitconfig"
alias gitrc="vim ~/dotfiles/etc/git/gitconfig.ini"
alias gitrc_="vim ./.git/config"
alias rangerrc="vim ~/.config/ranger/rc.conf"
#alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias muttrc="vim -S ~/Workspace/etc/Mac/mutt/workspace.vim"
alias tigrc="vim ~/.tigrc"
# alias vimchanges="vim $(git status --porcelain | awk '{print $2}')"

# Shadowsocks proxy
alias proxy='export all_proxy=http://127.0.0.1:1080'
alias unproxy='unset all_proxy'
alias myip="curl https://ip.cn"
alias hosts='sudo vim /etc/hosts'

# frequent commands
alias ju="jupyter notebook"
alias ipy="ipython"
alias repos="cd ~/Workspace/repos"
#alias you="youtube-dl -civw --proxy "socks5://127.0.0.1:1086" -f best/mp4 --write-sub "
alias you="youtube-dl"
alias yourc="vim ~/.config/youtube-dl/config"
#alias fzf="~/.fzf/bin/fzf --height 40%"
#alias vfzf="vim $(fzf)"
#alias dfzf="cd $(sh 'find * -type d | fzf')"

# Git commands
alias gs="git status"
alias gc="git add .; git commit"
# alias gd="git diff --word-diff=plain"
alias gd="git diff"
alias gco="git checkout"
alias gsc="git sync"
alias gcp="git add .; git quickcommit; git pub"
alias gcl="git clone"

# Docker
alias gitbook='docker run -it --name gitbook --rm -v "$PWD":/gitbook -p 4000:4000 billryan/gitbook gitbook'

# Tmux
#alias tmux="TERM=screen-256color-bce tmux"
alias pname="printf '\033]2;%s\033\\'"  # Set Tmux Pane title
# Please do not Overwite the `title` command/function

# Python Virtualenv
alias venv2="source ~/virtualenv/venv2/bin/activate"
alias venv3="source ~/virtualenv/venv3/bin/activate"
alias venv-ju="source ~/virtualenv/venv-ju/bin/activate"
alias venv-nvim="source ~/virtualenv/venv-ju/bin/activate"

# IDE
alias sub="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias vsc="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

# Browsers
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias safari="/Applications/Safari.app/Contents/MacOS/Safari"
alias opera="/Applications/Opera.app/Contents/MacOS/Opera"
