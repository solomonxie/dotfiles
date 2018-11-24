#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Raspbian / MacOS Sierra
# Run:
#   $ install_zsh.sh "Mac OS X"

set -ax

REPO_ROOT="https://raw.githubusercontent.com/solomonxie/dotfiles/master"


do_init_zsh(){
    # Get distro information
    distro=""
    while [ $# -gt 0 ] ;do
        case "$1" in
            "--distro")
                distro=$2 
                shift 2;;
        esac
    done
    # Do different things with different OS
    case $distro in
        "ubuntu")
            install_zsh_ubuntu ;;
        "raspbian")
            install_zsh_rpi ;;
        "mac")
            install_zsh_mac ;;
    esac
}


install_zsh_ubuntu(){
    echo "-----[  START SETTING UP ZSH   ]-----"
    sudo apt-get install zsh -y
    if [ ! -e /bin/zsh ];then echo "[  FAILED  ]:----ZSH----"; fi

    echo "-----[  INSTALLING OH-MY-ZSH   ]-----"
    curl -sSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sudo sh
    if [ ! -e ~/.oh-my-zsh/ ];then echo "[  FAILED  ]:----Oh-My-ZSH----"; fi

    echo "-----[  OVERWRITE ZSHRC   ]-----"
    sudo cp $HOME/dotfiles/zsh/zshrc ~/.zshrc
    sudo cp $HOME/dotfiles/zsh/zshrc-themes ~/.zshrc.themes
    sudo cp $HOME/dotfiles/zsh/zshrc.extension ~/.zshrc.extension
    if [ ! -e ~/.zshrc ] || [ ! -e ~/.zshrc.extension ] || [ ! -e ~/.zshrc.themes ]; then
        echo "[  FAILED  ]:---zshrc---"
    fi

    echo "-----[  Installing Themes for ZSH   ]-----"
    sudo git clone --no-checkout https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    sudo pip install powerline-status
    if [ ! -e ~/.oh-my-zsh/custom/themes/powerlevel9k ];then 
        echo "[  FAILED  ]:----Powerlevel9k----"
    fi

    echo "-----[  Installing Themes for ZSH   ]-----"
    sudo chown -R ubuntu:ubuntu $HOME/.oh-my-zsh/

    echo "-----[  INSTALLING PLUGINS FOR ZSH   ]-----"
    ZSH_PLUGINS="$HOME/.oh-my-zsh/custom/plugins"
    sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS/zsh-syntax-highlighting
    if [ ! -e $ZSH_PLUGINS/zsh-syntax-highlighting ];then echo "[  FAILED  ]:----zsh-syntax-highlighting----"; fi
    sudo git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_PLUGINS/zsh-autosuggestions
    if [ ! -e $ZSH_PLUGINS/zsh-autosuggestions ];then echo "[  FAILED  ]:----zsh-autosuggestions----"; fi
}


install_zsh_rpi(){
    echo "-----[  START SETTING UP ZSH   ]-----"
    sudo apt-get install zsh -y

    echo "-----[  INSTALLING OH-MY-ZSH   ]-----"
    curl -sSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sudo sh

    echo "-----[  OVERWRITE ZSHRC   ]-----"
    sudo cp $HOME/dotfiles/zsh/zshrc ~/.zshrc
    sudo cp $HOME/dotfiles/zsh/zshrc-themes ~/.zshrc.themes
    sudo cp $HOME/dotfiles/zsh/zshrc.extension ~/.zshrc.extension


    echo "-----[  Installing Themes for ZSH   ]-----"
    sudo git clone --no-checkout https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    sudo wget -q https://raw.githubusercontent.com/agnoster/agnoster-zsh-theme/master/agnoster.zsh-theme -P ~/.oh-my-zsh/themes/
    sudo pip install powerline-status >> ~/.init/log_zsh.txt 1>&2

    echo "-----[  Installing Themes for ZSH   ]-----"
    sudo chown -R pi:pi $HOME/.oh-my-zsh/

    # Change default shell as Z-Shell
    sudo chsh -s /bin/zsh
    /bin/zsh

    echo "-----[  INSTALLING PLUGINS FOR ZSH   ]-----"
    sudo git clone --no-checkout https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting 
    sudo git clone --no-checkout https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
}


# Entry point
do_init_zsh "$@"