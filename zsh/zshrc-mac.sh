######################################################
#                  _________  _   _                  #
#                 |__  / ___|| | | |                 #
#                   / /\___ \| |_| |                 #
#                  / /_ ___) |  _  |                 #
#                 /____|____/|_| |_|                 #
#                                                    #
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com> #
######################################################
# HOW TO FIND THE SLOW PART OF LOADING ZSH: $ zsh -xv

#######################################################################
#                      IMPORT MODULIZED SETTINGS                      #
#######################################################################
if [[ "$0" =~ "zsh" ]]; then
    source ~/dotfiles/zsh/zsh-plugins.sh
    source ~/dotfiles/zsh/themes.sh
    source ~/dotfiles/zsh/ohmyzsh-settings.sh  # Must be after theme settings
fi
source ~/dotfiles/zsh/bash-alias.sh
source ~/dotfiles/zsh/bash-functions.sh
source ~/dotfiles/zsh/fzf-settings.sh
[[ -e ~/.bashrc-local.sh ]] && source ~/.bashrc-local.sh ||true


#######################################################################
#                          GENERAL SETTINGS                           #
#######################################################################
# Vi mode
# set editing-mode vi

# Default Editor (Ctrl-x plus Ctrl-e to pop editor for current shell command)
[[ -e $(command -v nvim) ]] && export EDITOR=nvim || export EDITOR=vim

# set -o vi

# Get rid of "you have a mail" from crontab
MAILCHECK=0

# User-specified hosts (not working at the moment)
# set HOSTALIASES=~/hosts

# Set Default Title (Useful for Tmux pane-border title)
# printf "\033]0;%s\a" "TITLE"  #THIS JEPERDIZE SOME PROGRAMS (etc., ANSIBLE)


#zstyle ':completion:*' menu select # select completions with arrow keys
#zstyle ':completion:*' group-name '' # group results by category
# enable approximate matches for completion
#zstyle ':completion:::::' completer _expand _complete _ignored _approximate
# [ Conflict options ]
    #setopt auto_list # automatically list choices on ambiguous completion
    #setopt auto_menu # automatically use menu completion
    #setopt always_to_end # move cursor to end if word had one match
    #setopt correct_all # autocorrect commands
# [ Compatible with BASH ]
    # -> Fixing error: "zsh: no matches found"
    setopt no_nomatch


#######################################################################
#                       KEY BINDINGS / MAPPINGS                       #
#######################################################################
if [[ "$0" =~ "zsh" ]]; then
    bindkey '^p' up-line-or-search # Up arrow
    bindkey '^n' down-line-or-search # Down arrow
    # [autosuggestions] (history conflict with zsh hints, not recommanded)
    #bindkey '^e' autosuggest-accept # [Essential] Ctrl+i to confirm hint
    #bindkey -e
fi

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

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"  # Curl newer version
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
# Python
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/virtualenv/venv2/bin:$PATH"
export PATH="$HOME/virtualenv/venv/bin:$PATH"

export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"

#######################################################################
#                              HOMEBREW                               #
#######################################################################
export HOMEBREW_NO_AUTO_UPDATE=1


#Java
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home"
# export JAVA_HOME=$(/usr/libexec/java_home)

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/mc mc

# Fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Autojump
# [[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

# Broot
# source /Users/xiaoboxie/Library/Preferences/org.dystroy.broot/launcher/bash/br
