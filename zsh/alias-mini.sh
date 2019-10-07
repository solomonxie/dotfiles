# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
#
# Description: Additional configs for zshrc, which aren't good for public.
#
#
#
# ==== ALIAS ====

# Builtin Utils
alias lah="ls -lah"

# Program replacements
#alias vim="nvim"

# Config files
alias zshrc="vim ~/dotfiles/zsh/zshrc-mini.sh"
alias zshrc2="vim ~/dotfiles/zsh/aliases-mini.sh"
alias zshrc3="vim ~/dotfiles/zsh/themes.sh"
alias vimrc="vim ~/.vimrc"
alias vimrc2="vim ~/dotfiles/vim/vimrc-keymappings.vim"
alias vimrc3="vim ~/dotfiles/vim/vimrc-plugins.vim"
alias tmuxrc="vim ~/.tmux.conf"
alias bashrc="vim ~/.bash_profile"
alias gitrc="vim ~/.gitconfig"

# Shadowsocks proxy
alias proxy='export ALL_PROXY=socks5://127.0.0.1:1080'
alias unproxy='unset ALL_PROXY'
alias myip='curl https://ip.cn'
alias hosts='sudo vim /etc/hosts'

# frequent commands
alias ju="jupyter notebook"
alias repos="cd ~/Workspace/repos"
alias you="youtube-dl"

# Git commands
alias gs="git status"
alias gc="git add .; git commit"
alias gd="git diff"
alias gco="git checkout"
alias gcp="git add .; git commit -m \"Update from $USER\"; git remote | xargs -L1 git push --all"

# Tmux
#alias tmux="TERM=screen-256color-bce tmux"

# Python Virtualenv
alias venv2="source ~/virtualenv/venv2/bin/activate"
alias venv3="source ~/virtualenv/venv3/bin/activate"
alias venv-ju="source ~/virtualenv/venv-ju/bin/activate"
