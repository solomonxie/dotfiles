######################################################
#                  _________  _   _                  #
#                 |__  / ___|| | | |                 #
#                   / /\___ \| |_| |                 #
#                  / /_ ___) |  _  |                 #
#                 /____|____/|_| |_|                 #
#                                                    #
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com> #
######################################################

#######################################################################
#                      IMPORT MODULIZED SETTINGS                      #
#######################################################################
if [[ -z "$ZSH" ]]; then
    source ~/dotfiles/zsh/plugin-settings.sh
    source ~/dotfiles/zsh/themes.sh
    source ~/dotfiles/zsh/ohmyzsh-settings.sh  # Must be after theme settings
fi
source ~/dotfiles/zsh/bash-alias.sh
source ~/dotfiles/zsh/bash-functions.sh
source ~/dotfiles/zsh/fzf-settings.sh
[[ ! -f ~/.bashrc-local.sh ]] && touch ~/.bashrc-local.sh
source ~/.bashrc-local.sh


#######################################################################
#                          GENERAL SETTINGS                           #
#######################################################################
# Important: Locale
export LANG=en_US.UTF-8

# Vi mode
# set editing-mode vi
# export EDITOR=vim
# set -o vi

# Get rid of "you have a mail" from crontab
MAILCHECK=0

# User-specified hosts (not working at the moment)
# set HOSTALIASES=~/hosts

# Set Default Title (Useful for Tmux pane-border title)
printf "\033]0;%s\a" "TITLE"


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
if [[ -z "$ZSH" ]]; then
    bindkey '^p' up-line-or-search # Up arrow
    bindkey '^n' down-line-or-search # Down arrow
    # [autosuggestions] (history conflict with zsh hints, not recommanded)
    #bindkey '^e' autosuggest-accept # [Essential] Ctrl+i to confirm hint
    #bindkey -e
fi
