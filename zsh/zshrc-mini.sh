# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>

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
        setopt no_nomatch
# }


# Key Bindings / Mappings {
    bindkey '^p' up-line-or-search # Up arrow
    bindkey '^n' down-line-or-search # Down arrow
# }


# Setting up Oh-my-zsh {
    export ZSH=~/.oh-my-zsh
    plugins=(
      # git,
      #history-substring-search,
      # colored-man-pages
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
