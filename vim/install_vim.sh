#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Raspbian / MacOS Sierra
# Commands:
#   1. Get in VIM
#   2. :PluginInstall
#   3. If there's permission problem: $ sudo chown -R $USER:$USER ~/.vim
#   4. :PluginInstall

set -ex

REPO_ROOT="https://raw.githubusercontent.com/solomonxie/dotfiles/master"


do_install_vim(){
    # Load uitility functions (check os)
    if [ ! -r /tmp/bash-utils.sh ]; then
        curl -fsSL $REPO_ROOT/utils.sh -o /tmp/bash-utils.sh
    fi
    source /tmp/bash-utils.sh

    # Get distro
    case $(get_distro) in
        "ubuntu")
            install_vim_ubuntu ;;
        "raspbian")
            install_vim_rpi ;;
        "mac")
            install_vim_mac ;;
    esac
}

install_vim_ubuntu(){
    mkdir $HOME/.vim
    export VIM="$HOME/.vim"

    sudo apt-get install vim -y

    # ---SETING UP VIM ---
    echo "-----[  OVERWRITING VIMRC CONFIG   ]-----"
    curl -fsSL $REPO_ROOT/vim/vimrc-ubuntu -o $HOME/.vimrc

    echo "-----[  DOWNLOADING VUNDLE - VIM PLUGIN MANAGER   ]-----"
    git clone --no-checkout https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    echo "-----[  Change permission   ]-----"
    sudo chown -R ubuntu:ubuntu ~/.vim
    # sudo chown -R ubuntu ~/.vim >> ~/.init/log_vim.txt 1>&2

    echo "-----[  INSTALLING VIM COLOR SCHEME   ]-----"
    mkdir -p $HOME/.vim/colors
    curl -fsSL $REPO_ROOT/vim/colors/gruvbox -o $HOME/.vim/colors/
}

install_vim_rpi(){
    mkdir ~/.vim
    export VIM=~/.vim

    yes | sudo apt-get install vim

    # ---SETING UP VIM ---
    echo "-----[  OVERWRITING VIMRC CONFIG   ]-----"
    curl -fsSL $REPO_ROOT/vim/vimrc-rpi -o $HOME/.vimrc

    echo "-----[  DOWNLOADING VUNDLE - VIM PLUGIN MANAGER   ]-----"
    git clone --no-checkout https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    echo "-----[  Change permission   ]-----"
    sudo chown -R pi:pi ~/.vim
    #sudo chown -R ubuntu ~/.vim >> ~/.init/log_vim.txt 1>&2

    echo "-----[  INSTALLING VIM COLOR SCHEME   ]-----"
    mkdir -p $HOME/.vim/colors
    curl -fsSL $REPO_ROOT//vim/colors/gruvbox -o $HOME/.vim/colors/
}

install_vim_mac(){
    echo "vim on mac"    
}

# Start this script
do_install_vim