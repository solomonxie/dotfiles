#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Raspbian / MacOS Sierra
#
# Run:
#   $ ./install_zsh.sh --os ubuntu
# Debug:
#   $ bashdb ./install_zsh.sh --os ubuntu


set -x

if [ !-e ~/.dotfiles.env ];then echo "[ ~/.dotfiles.env ] NOT found."; exit 1; fi
source ~/.dotfiles.env

#-------------------------------------
#     Installation Methods
#-------------------------------------

do_init_zsh(){
    # Do different things with different OS
    case $MYOS in
        ubuntu|raspbian)
            sudo apt-get install zsh -y
            ;;
        mac)
            brew install zsh
            ;;
    esac
    # Make paths for ZSH extensions
    mkdir -p "$HOUSE/.zsh"
    # Install Plugins
    install_zsh_plugins
    # Check installment
    do_test_installment_zsh
    change_default_shell_zsh

    # Create Symlinks
    ln -sf $SRC/zsh/zshrc $HOUSE/.zshrc
    ln -sf $SRC/zsh/zshrc.themes $HOUSE/.zshrc.themes
    ln -sf $SRC/zsh/zshrc.extension $HOUSE/.zshrc.extension
}



install_zsh_plugins(){
    echo "-----[  INSTALLING OH-MY-ZSH   ]-----"
    curl -sSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    echo "-----[  Installing Themes for ZSH   ]-----"
    git clone https://github.com/bhilburn/powerlevel9k.git $HOUSE/.oh-my-zsh/custom/themes/powerlevel9k
    sudo pip install powerline-status
    echo "-----[  INSTALLING PLUGINS FOR ZSH   ]-----"
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOUSE/.zsh/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOUSE/.zsh/zsh-syntax-highlighting
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
    if [ -e $HOUSE/.oh-my-zsh/ ];then 
        echo "[  OK  ]:----Oh-My-ZSH----"
    else
        echo "[  FAILED  ]:----Oh-My-ZSH----"
    fi
    if [ -e $HOUSE/.zsh/zsh-syntax-highlighting ];then 
        echo "[  OK  ]:----zsh-syntax-highlighting----"
    else
        echo "[  FAILED  ]:----zsh-syntax-highlighting----"
    fi
    if [ -e $HOUSE/.zsh/zsh-autosuggestions ];then 
        echo "[  OK  ]:----zsh-autosuggestions----"
    else
        echo "[  FAILED  ]:----zsh-autosuggestions----"
    fi
    if [ -e $HOUSE/.oh-my-zsh/custom/themes/powerlevel9k ];then 
        echo "[  OK  ]:----Powerlevel9k----"
    else
        echo "[  FAILED  ]:----Powerlevel9k----"
    fi
}




#-------------------------------------
#          Entry points
#-------------------------------------

do_init_zsh "$@"




