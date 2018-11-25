#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Raspbian / MacOS Sierra
#
# Run:
#   $ ./install_zsh.sh --distro ubuntu
# Debug:
#   $ bashdb ./install_zsh.sh --distro ubuntu


set -ax

REPO_URL="https://raw.githubusercontent.com/solomonxie/dotfiles/master"

ZSH_PLUGINS="~/.zsh"
#ZSH_PLUGINS="~/.oh-my-zsh/custom/plugins"
mkdir -p $ZSH_PLUGINS

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
            install_zsh_ubuntu
            install_zsh_plugins
            ;;
        "raspbian")
            install_zsh_rpi
            install_zsh_plugins
            ;;
        "mac")
            install_zsh_mac
            install_zsh_plugins
            ;;
    esac
    # Check installment
    do_test_installment_zsh
    change_default_shell_zsh
}


install_zsh_ubuntu(){
    echo "-----[  START SETTING UP ZSH   ]-----"
    sudo apt-get install zsh -y

    echo "-----[  OVERWRITE ZSHRC   ]-----"
    cp ~/dotfiles/zsh/zshrc ~/.zshrc
    cp ~/dotfiles/zsh/zshrc-themes ~/.zshrc.themes
    cp ~/dotfiles/zsh/zshrc.extension ~/.zshrc.extension
}


install_zsh_rpi(){
    echo "-----[  START SETTING UP ZSH   ]-----"
    sudo apt-get install zsh -y

    echo "-----[  OVERWRITE ZSHRC   ]-----"
    sudo cp ~/dotfiles/zsh/zshrc ~/.zshrc
    sudo cp ~/dotfiles/zsh/zshrc-themes ~/.zshrc.themes
    sudo cp ~/dotfiles/zsh/zshrc.extension ~/.zshrc.extension
}

install_zsh_plugins(){
    echo "-----[  INSTALLING OH-MY-ZSH   ]-----"
    curl -sSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sudo sh
    echo "-----[  Installing Themes for ZSH   ]-----"
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    sudo pip install powerline-status
    echo "-----[  INSTALLING PLUGINS FOR ZSH   ]-----"
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_PLUGINS/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS/zsh-syntax-highlighting
}


change_default_shell_zsh(){
    echo "-----[  CHANGE DEFAULT SHELL FOR THIS USER   ]-----"
    echo "vim command  :%s/$USER.+\/bin\/bash$/\/bin\/zsh"
}


do_test_installment_zsh(){
    if [ -e /bin/zsh ];then 
        echo "[  OK  ]:----ZSH----"
    else
        echo "[  FAILED  ]:----ZSH----"
    fi
    if [ -e ~/.oh-my-zsh/ ];then 
        echo "[  OK  ]:----Oh-My-ZSH----"
    else
        echo "[  FAILED  ]:----Oh-My-ZSH----"
    fi
    if [ -e $ZSH_PLUGINS/zsh-syntax-highlighting ];then 
        echo "[  OK  ]:----zsh-syntax-highlighting----"
    else
        echo "[  FAILED  ]:----zsh-syntax-highlighting----"
    fi
    if [ -e $ZSH_PLUGINS/zsh-autosuggestions ];then 
        echo "[  OK  ]:----zsh-autosuggestions----"
    else
        echo "[  FAILED  ]:----zsh-autosuggestions----"
    fi
    if [ -e ~/.oh-my-zsh/custom/themes/powerlevel9k ];then 
        echo "[  OK  ]:----Powerlevel9k----"
    else
        echo "[  FAILED  ]:----Powerlevel9k----"
    fi
}


# Entry point
do_init_zsh "$@"