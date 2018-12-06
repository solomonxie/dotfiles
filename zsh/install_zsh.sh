#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Raspbian / MacOS Sierra
#
# Run:
#   $ ./install_zsh.sh --os ubuntu
# Debug:
#   $ bashdb ./install_zsh.sh --os ubuntu


set -ax

MYHOME=`getent passwd ${SUDO_UID:-$(id -u)} | cut -d: -f 6`
REPO_URL="https://raw.githubusercontent.com/solomonxie/dotfiles/master"
SRC="$MYHOME/dotfiles"
OS=""

ZSH_PLUGINS="$MYHOME/.zsh"
mkdir -p $ZSH_PLUGINS

do_init_zsh(){
    if [ $# -eq 0 ]; then 
        echo "[ Failed ] Please specify OS version with --os flag."
        return 1; 
    fi
    # Get distro information
    while [ $# -gt 0 ] ;do
        case "$1" in
            "--os")
                OS=$2 
                shift 2;;
            "--src")
                SRC=$2 
                shift 2;;
        esac
    done
    # Do different things with different OS
    case $distro in
        ubuntu|raspbian)
            install_zsh_deb
            install_zsh_plugins
            setup_zsh
            ;;
        mac)
            install_zsh_mac
            install_zsh_plugins
            setup_zsh
            ;;
    esac
    # Check installment
    do_test_installment_zsh
    change_default_shell_zsh
}


install_zsh_deb(){
    echo "-----[  START SETTING UP ZSH   ]-----"
    sudo apt-get install zsh -y
}

install_zsh_mac(){
    echo "-----[  START SETTING UP ZSH   ]-----"
    brew install zsh
}


setup_zsh(){
    echo "-----[  OVERWRITE ZSHRC   ]-----"
    if [ -e "REPO_PATH" ]; then
        ln -sf $REPO_PATH/zsh/zshrc $MYHOME/.zshrc
        ln -sf $REPO_URL/zsh/zshrc.themes $MYHOME/.zshrc.themes
        ln -sf $REPO_URL/zsh/zshrc.extension $MYHOME/.zshrc.extension
    else
        wget $REPO_URL/zsh/zshrc -O $MYHOME/.zshrc
        wget $REPO_URL/zsh/zshrc.themes -O $MYHOME/.zshrc.themes
        wget $REPO_URL/zsh/zshrc.extension -O $MYHOME/.zshrc.extension
    fi
}


install_zsh_plugins(){
    echo "-----[  INSTALLING OH-MY-ZSH   ]-----"
    curl -sSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    echo "-----[  Installing Themes for ZSH   ]-----"
    git clone https://github.com/bhilburn/powerlevel9k.git $MYHOME/.oh-my-zsh/custom/themes/powerlevel9k
    sudo pip install powerline-status
    echo "-----[  INSTALLING PLUGINS FOR ZSH   ]-----"
    git clone https://github.com/zsh-users/zsh-autosuggestions $MYHOME/.zsh/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $MYHOME/.zsh/zsh-syntax-highlighting
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
    if [ -e $MYHOME/.oh-my-zsh/ ];then 
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
    if [ -e $MYHOME/.oh-my-zsh/custom/themes/powerlevel9k ];then 
        echo "[  OK  ]:----Powerlevel9k----"
    else
        echo "[  FAILED  ]:----Powerlevel9k----"
    fi
}


# Entry point
do_init_zsh "$@"