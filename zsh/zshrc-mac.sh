#""""""""""""""""""""""""""""""""""""
#         _________  _   _          "
#        |__  / ___|| | | |         "
#          / /\___ \| |_| |         "
#         / /_ ___) |  _  |         "
#        /____|____/|_| |_|         "
#                                   "
#""""""""GENERATED-BY-FIGLET"""""""""
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
#
# Commands:
#

# User-specified hosts (not working at the moment)
    # set HOSTALIASES=~/hosts

# Make some device-specific aliased in another file
    source ~/dotfiles/zsh/alias-mac.sh

# Theme settings {
    source ~/dotfiles/zsh/themes.sh

    # Light Themes
    export ZSH_THEME="awesomepanda"  # export TERM="xterm-256color"
    # export ZSH_THEME="aussiegeek"  # export TERM="xterm-256color"
    # export ZSH_THEME="crunch"  # export TERM="xterm-256color"
    # export ZSH_THEME="eastwood"  # export TERM="xterm-256color"
    # export ZSH_THEME="minimal"  # export TERM="xterm-256color"
    # export ZSH_THEME="fwalch"  # export TERM="xterm-256color"
    # export ZSH_THEME="gallois"  # export TERM="xterm-256color"
    # export ZSH_THEME="jonathan"  # export TERM="xterm-256color"
    # export ZSH_THEME="kardan"  # export TERM="xterm-256color"
    # export ZSH_THEME="junkfood"  # export TERM="xterm-256color"

    # Heavy Themes
    # set_theme_powerlevel9k  # WAY TOO HEAVY EVEN FOR 16GB RAM MACBOOK PRO
    # set_theme_agnoster
    # set_theme_spaceship

    # Customer (Overwrite) Theme settings
# }

# General settings {
    # Important: Locale
    export LANG=en_US.UTF-8
    # Get rid of "you have a mail" from crontab
    MAILCHECK=0
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

# Setting up Oh-my-zsh {
    export ZSH=~/.oh-my-zsh
    export ZSH_CUSTOM=~/.oh-my-zsh/custom
    plugins=(  # DO NOT USE , COMMA TO SEPARATE PLUGINS
      history-substring-search
      colored-man-pages
      dircycle
      docker
      jsontools
      aws
      # gitfast
      # git-extras
    )
    # Disable update checks:
    DISABLE_UPDATE_PROMPT=true
    DISABLE_AUTO_UPDATE=true
    ZSH_DISABLE_COMPFIX=true
    DISABLE_MAGIC_FUNCTIONS=true  # Autocompletion has bug on pasting URL
    # Manually update oh-my-zsh: $ upgrade_oh_my_zsh
    source $ZSH/oh-my-zsh.sh
# }


# Plugins {
    # Fish-like commandline suggestions (not working with oh-my-zsh)
    if [ ! -e ~/.zsh/plugins/zsh-autosuggestions ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
    fi
    source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

    # Syntax highlighting
    if [ ! -e ~/.zsh/plugins/zsh-syntax-highlighting ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting
    fi
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
    #bindkey '^e' autosuggest-accept # [Essential] Ctrl+i to confirm hint
    #bindkey -e
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


# Overwite with local zshrc
if [ -e ~/.zshrc-local ]; then
    source ~/.zshrc-local
fi
