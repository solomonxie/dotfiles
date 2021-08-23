#! /usr/bin/env bash
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Raspbian / MacOS Sierra
#
# Run:
#   $ ./install_zsh.sh --os ubuntu
# Debug:
#   $ bashdb ./install_zsh.sh --os ubuntu


set -x

# Read environment variables
if [ ! -e /tmp/env-os -a -e /tmp/env-user ]; then
    echo "Please run './configure' before installment."
    exit 1;
else
    export MYOS=`cat /tmp/env-os`
    export USER=`cat /tmp/env-user`
fi

#-------------------------------------
#     Installation Methods
#-------------------------------------

do_init_zsh(){
    # Make paths for ZSH extensions
    mkdir -p "$HOME/.zsh"

    # Do different things with different OS
    case $MYOS in
        ubuntu|raspbian)
            sudo apt-get install zsh -y
            # Install Plugins
            install_zsh_plugins
            # Link config file
            ln -sf $HOME/myconf/dotfiles/zsh/zshrc $HOME/.zshrc
            ;;
        mac)
            brew install zsh
            # Install Plugins
            install_zsh_plugins
            # Link config file
            ln -sf $HOME/myconf/dotfiles/zsh/zshrc-mac $HOME/.zshrc
            # Theme: powerlevel9k
                #git clone https://github.com/bhilburn/powerlevel9k.git $HOME/.oh-my-zsh/custom/themes/powerlevel9k
                #pip install powerline-status --user
            ;;
    esac

    # Check installment
    echo "-----[  CHANGE DEFAULT SHELL FOR THIS USER   ]-----"
    sudo usermod -s /bin/zsh $ME
}



install_zsh_plugins(){
    if [ -e $HOME/.oh-my-zsh ];then rm -rf $HOME/.oh-my-zsh ; fi
    echo "-----[  INSTALLING OH-MY-ZSH   ]-k----"
    curl -sSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    echo "-----[  INSTALLING PLUGINS FOR ZSH   ]-----"
    if [ -e $HOME/.zsh ];then rm -rf $HOME/.zsh; fi
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh_plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/plugins/.zsh/zsh-syntax-highlighting
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
    if [ -e $HOME/.oh-my-zsh/ ];then
        echo "[  OK  ]:----Oh-My-ZSH----"
    else
        echo "[  FAILED  ]:----Oh-My-ZSH----"
    fi
    if [ -e $HOME/.zsh/zsh-syntax-highlighting ];then
        echo "[  OK  ]:----zsh-syntax-highlighting----"
    else
        echo "[  FAILED  ]:----zsh-syntax-highlighting----"
    fi
    if [ -e $HOME/.zsh/zsh-autosuggestions ];then
        echo "[  OK  ]:----zsh-autosuggestions----"
    else
        echo "[  FAILED  ]:----zsh-autosuggestions----"
    fi
    if [ -e $HOME/.oh-my-zsh/custom/themes/powerlevel9k ];then
        echo "[  OK  ]:----Powerlevel9k----"
    else
        echo "[  FAILED  ]:----Powerlevel9k----"
    fi
}




#-------------------------------------
#          Entry points
#-------------------------------------

do_init_zsh "$@"




