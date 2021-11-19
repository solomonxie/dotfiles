#! zsh
######################################################
#                  _________  _   _                  #
#                 |__  / ___|| | | |                 #
#                   / /\___ \| |_| |                 #
#                  / /_ ___) |  _  |                 #
#                 /____|____/|_| |_|                 #
#                                                    #
######################################################

#######################################################################
#                      IMPORT MODULIZED SETTINGS                      #
#######################################################################
# if [[ "$0" =~ "zsh" ]]; then  # >>> PLUGINS >>>
source ~/myconf/dotfiles/zsh/zsh-performance.sh
source ~/myconf/dotfiles/zsh/bindkeys.zsh
source ~/myconf/dotfiles/zsh/zsh-completion.sh

# PLUGINS
source ~/myconf/dotfiles/zsh/pluginconfigs/zsh-syntax-highlighting.sh  # -> 16ms
source ~/myconf/dotfiles/zsh/pluginconfigs/zsh-autosuggestions.sh  # -> 50ms
# source ~/myconf/dotfiles/zsh/pluginconfigs/zsh-autocomplete.sh  #1100ms -> SUPER SLOW & UGLY
source ~/myconf/dotfiles/zsh/pluginconfigs/zsh-cmd-time.sh

# UTILS
# source ~/myconf/dotfiles/zsh/pluginconfigs/autojump.sh
# source ~/myconf/dotfiles/zsh/pluginconfigs/broot.sh

# THEMES
# source ~/myconf/dotfiles/zsh/ohmyzsh-settings.sh
# source ~/myconf/dotfiles/zsh/pluginconfigs/pure-zsh.sh
# source ~/myconf/dotfiles/zsh/pluginconfigs/myminimalist-theme.sh
# source ~/myconf/dotfiles/zsh/pluginconfigs/zsh-theme-minimal.sh
# source ~/myconf/dotfiles/zsh/pluginconfigs/zsh-theme-powerlevel10k.sh
source ~/myconf/dotfiles/zsh/pluginconfigs/git-prompt.sh  # BLAZING FAST!!
# fi

source ~/myconf/dotfiles/zsh/zsh-envs.sh
source ~/myconf/dotfiles/zsh/bash-alias.sh
source ~/myconf/dotfiles/zsh/bash-functions.sh
[[ -e ~/.bashrc-local.sh ]] && source ~/.bashrc-local.sh ||true

# alias alias=:  # Avoid override by other installations

#######################################################################
#                          GENERAL SETTINGS                           #
#######################################################################
# Vi mode
# set editing-mode vi

# Default Editor (Ctrl-x plus Ctrl-e to pop editor for current shell command)
# [[ -e $(command -v nvim) ]] && export EDITOR=nvim || export EDITOR=vim
export EDITOR=nvim || export EDITOR=vim
alias vim="nvim" && alias vimdiff="nvim -d"

# set -o vi

# Get rid of "you have a mail" from crontab
MAILCHECK=0

# History
HISTFILE=~/.bash_history
HISTSIZE=50000
SAVEHIST=10000
setopt appendhistory
setopt extendedhistory
setopt sharehistory
setopt incappendhistory

# User-specified hosts (not working at the moment)
# set HOSTALIASES=~/hosts

# Set Default Title (Useful for Tmux pane-border title)
# printf "\033]0;%s\a" "TITLE"  #THIS JEPERDIZE SOME PROGRAMS (etc., ANSIBLE)


#######################################################################
#                             GENERAL UI                              #
#######################################################################
# REF: https://geoff.greer.fm/lscolors/
# export LSCOLORS='BXfxcxdxbxegedabagacad'  # BSD
export LS_COLORS='di=1;34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'  # LINUX


#######################################################################
#                    PATH / ENVIRONMENT VARIABLES                     #
#######################################################################
# Some would be imported here by other programms automatically
# etc., cat 'expot path=...' > ~/.zshrc

# IMPORTANT!!
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

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/nvim-osx64/bin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/bin/:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"  # Curl newer version
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
# =====PYTHON=====
export PATH="/usr/local/opt/python@2/bin:$PATH"
export PATH="$HOME/virtualenv/venv2/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export PATH="/usr/local/opt/python@3.7/bin:$PATH"
export PATH="/usr/local/opt/python@3/bin:$PATH"
export PATH="$HOME/virtualenv/venv/bin:$PATH"
# =====NODE.JS=====
export PATH="/usr/local/opt/node@10/bin:$PATH"
export PATH="$HOME/.nvm/versions/node/v10.17.0/bin:$PATH"
export PATH="$HOME/virtualnode/venv/bin/:$PATH"
export PATH="$HOME/virtualnode/venv10/bin/:$PATH"
# ======Java============
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home"
# export JAVA_HOME=$(/usr/libexec/java_home)
# ======Snowflake========
export PATH=/Users/xiaoboxie/Applications/SnowSQL.app/Contents/MacOS:$PATH
# =====OTHER-PATH========
export PATH="$HOME/workspace/bin:$PATH"
# =====GNU BIN===============
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
# =====MISC===============
export HOMEBREW_NO_AUTO_UPDATE=1
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"


# BETTER TO BE AT THE BOTTOM
source ~/myconf/dotfiles/zsh/pluginconfigs/fzf.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
