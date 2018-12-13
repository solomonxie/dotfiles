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

MYHOME=${$(`getent passwd ${SUDO_UID:-$(id -u)} | cut -d: -f 6`):-$HOME}
REPO_URL="git@github.com:solomonxie/dotfiles.git"
SRC="$MYHOME/dotfiles"

# Download Repo if not exists
if [ ! -e $MYHOME/dotfiles ]; then
    git clone $REPO_URL $MYHOME/dotfiles
fi

# Check flags
if [ $# -eq 0 ]; then 
    echo "[ Failed ] Please specify OS version with --os flag."
    return 1; 
fi

#-------------------------------------
#     Installation Methods
#-------------------------------------

do_init_zsh(){
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
    # Make paths for ZSH extensions
    mkdir -p "$MYHOME/.zsh"
    # Do different things with different OS
    case $distro in
        ubuntu|raspbian)
            sudo apt-get install zsh -y
            ;;
        mac)
            brew install zsh
            ;;
    esac
    # Install Plugins
    install_zsh_plugins
    # Check installment
    do_test_installment_zsh
    change_default_shell_zsh

    # Create Symlinks
    ln -sf $SRC/zsh/zshrc $MYHOME/.zshrc
    ln -sf $SRC/zsh/zshrc.themes $MYHOME/.zshrc.themes
    ln -sf $SRC/zsh/zshrc.extension $MYHOME/.zshrc.extension
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



#-------------------------------------
#          Unit Tests
#-------------------------------------

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
    if [ -e $MYHOME/.zsh/zsh-syntax-highlighting ];then 
        echo "[  OK  ]:----zsh-syntax-highlighting----"
    else
        echo "[  FAILED  ]:----zsh-syntax-highlighting----"
    fi
    if [ -e $MYHOME/.zsh/zsh-autosuggestions ];then 
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




#-------------------------------------
#          Entry points
#-------------------------------------

do_init_zsh "$@"




