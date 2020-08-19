#######################################################################
#                      OH-MY-ZSH PLUGIN MANAGER                       #
#######################################################################
# https://github.com/ohmyzsh/ohmyzsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "`wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh`"
    export ZSH=~/.oh-my-zsh
    source $ZSH/oh-my-zsh.sh
fi
export ZSH=~/.oh-my-zsh
export ZSH_CUSTOM=~/.oh-my-zsh/custom

# Manually update oh-my-zsh: $ upgrade_oh_my_zsh

plugins=(  # DO NOT USE , COMMA TO SEPARATE PLUGINS
  # history-substring-search
  # colored-man-pages
  # dircycle
  # docker
  # jsontools
  # aws
  # gitfast
  # git-extras
)

# Disable update checks:
DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true
ZSH_DISABLE_COMPFIX=true
DISABLE_MAGIC_FUNCTIONS=true  # Autocompletion has bug on pasting URL


#######################################################################
#                            LIGHT THEMES                             #
#######################################################################
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


#######################################################################
#                            HEAVY THEMES                             #
#######################################################################
# set_theme_powerlevel9k  # WAY TOO HEAVY EVEN FOR 16GB RAM MACBOOK PRO
# set_theme_agnoster
# set_theme_spaceship

# Customer (Overwrite) Theme settings
# ...

#######################################################################
#                   CUSTOMIZED THEME: AWESOME PANDA                   #
#######################################################################
# source ~/dotfiles/zsh/pluginconfigs/ohmyzsh-theme-awesome-panda.sh

#######################################################################
#                              AT BOTTOM                              #
#######################################################################
source $ZSH/oh-my-zsh.sh
