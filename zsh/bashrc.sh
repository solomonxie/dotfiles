#######################################################################
#                                BASH                                 #
#######################################################################
export LANG=en_US.UTF-8
printf "\033]0;%s\a" "TITLE"
HISTFILESIZE=2000
shopt -s histappend  # append to the history file, don't overwrite it
shopt -s checkwinsize  # check the window size

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '


#######################################################################
#                              SOURCING                               #
#######################################################################
source ~/dotfiles/zsh/bash-alias.sh
source ~/dotfiles/zsh/bash-functions.sh
[[ ! -f ~/.bashrc-local.sh ]] && touch ~/.bashrc-local.sh
source ~/.bashrc-local.sh
