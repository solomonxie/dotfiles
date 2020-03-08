#######################################################################
#                      OH-MY-ZSH PLUGIN MANAGER                       #
#######################################################################
# https://github.com/ohmyzsh/ohmyzsh
if [[ ! -d ~/.oh-my-zsh ]];then
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
export ZSH=~/.oh-my-zsh
export ZSH_CUSTOM=~/.oh-my-zsh/custom
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
# Manually update oh-my-zsh: $ upgrade_oh_my_zsh
source $ZSH/oh-my-zsh.sh
