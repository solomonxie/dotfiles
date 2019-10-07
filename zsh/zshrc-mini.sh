# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
#
# Preload dependencies:
#     # Plugin: Syntax-highlighting
#     $ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
#     # Plugin: zsh-autosuggestions
#     $ git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
#     # Theme: Agnoster
#     $ wget https://raw.githubusercontent.com/agnoster/agnoster-zsh-theme/master/agnoster.zsh-theme -P ~/.oh-my-zsh/themes/
#     # Theme: Powerlevel9k
#     $ git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
#
# Commands:
#

# User-specified hosts (not working at the moment)
    set HOSTALIASES=~/hosts

# Make some device-specific aliased in another file
    source ~/dotfiles/zsh/alias-mini.sh

# Theme settings {
    # Light Themes
    # export ZSH_THEME="awesomepanda"  # export TERM="xterm-256color"
    export ZSH_THEME="aussiegeek"  # export TERM="xterm-256color"
    # export ZSH_THEME="crunch"  # export TERM="xterm-256color"
    # export ZSH_THEME="eastwood"  # export TERM="xterm-256color"
    # export ZSH_THEME="minimal"  # export TERM="xterm-256color"
    # export ZSH_THEME="kardan"  # export TERM="xterm-256color"
    # export ZSH_THEME="junkfood"  # export TERM="xterm-256color"

    # Heavy Themes
    # source ~/dotfiles/zsh/themes.sh
    # set_theme_powerlevel9k  # WAY TOO HEAVY EVEN FOR 16GB RAM MACBOOK PRO
    # set_theme_agnoster
    # set_theme_spaceship
# }

# General settings {
    MAILCHECK=0   # Get rid of "you have a mail" from crontab
# }

# Builtin behaviors {
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
# }


# Plugins {
    # Fish-like commandline suggestions (not working with oh-my-zsh)
    source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # Setups for plugins {
        # [zsh-autosuggestions]
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6' # [Essential]
        # [zsh-history-substring-search]
    # }
# }


# Key Bindings / Mappings {
    bindkey '^p' up-line-or-search # Up arrow
    bindkey '^n' down-line-or-search # Down arrow
    # [autosuggestions] (history conflict with zsh hints, not recommanded)
    #bindkey '^i' autosuggest-accecpt # [Essential] Ctrl+i to confirm hint
# }


# Setting up Oh-my-zsh {
    export ZSH=~/.oh-my-zsh
    plugins=(
      git,
      #history-substring-search,
      colored-man-pages
    )
    # Disable update checks:
    DISABLE_UPDATE_PROMPT=true
    DISABLE_AUTO_UPDATE=true
    ZSH_DISABLE_COMPFIX=true
    # Fix color for ls command
    LS_COLORS=$LS_COLORS:'ow=37;42:'
    # Manually update oh-my-zsh: $ upgrade_oh_my_zsh
    # Use oh-my-zsh
    source $ZSH/oh-my-zsh.sh
# }


# Setup fzf Searching tool {
    # Import binary execution to PATH
    if [[ ! "$PATH" == *~/.fzf/bin* ]]; then export PATH="$PATH:$HOME/.fzf/bin"; fi
    # Import key bindings for auto completion
    [[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null
    # Import specific key bindings
    source "$HOME/.fzf/shell/key-bindings.zsh"
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    # Setup appearence (Highlighting, scale, preview...)
    export FZF_DEFAULT_OPTS="--height 40% --layout=reverse \
        --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
    # Setup default searching tool (to replace "find")
    if [ -x $(command -v fd) ]; then
        export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude .git'
        #export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    elif [ -x $(command -v rg) ]; then
        export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden \
            --follow --glob "!{.git,node_modules}/*" 2> /dev/null'
    #elif [ -x $(command -v ag) ]; then
        #
    fi
# }
