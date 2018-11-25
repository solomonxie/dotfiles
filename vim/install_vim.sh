#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Raspbian / MacOS Sierra
#
# Commands:
#   1. Get in VIM
#   2. :PluginInstall
#   3. If there's permission problem: $ sudo chown -R $USER:$USER ~/.vim
#   4. :PluginInstall
#
# Run:
#   $ ./install_vim.sh --distro ubuntu
# Debug:
#   $ bashdb ./install_vim.sh --distro ubuntu



set -ax

REPO_URL="https://raw.githubusercontent.com/solomonxie/dotfiles/master"
mkdir ~/.vim
export VIM="~/.vim"


do_install_vim(){
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
            install_vim_ubuntu ;;
        "raspbian")
            install_vim_rpi ;;
        "mac")
            install_vim_mac ;;
    esac
}

install_vim_ubuntu(){
    sudo apt-get install vim -y

    # ---SETING UP VIM ---
    echo "-----[  OVERWRITING VIMRC CONFIG   ]-----"
    curl -fsSL $REPO_URL/vim/vimrc-ubuntu -o ~/.vimrc

    echo "-----[  DOWNLOADING VUNDLE - VIM PLUGIN MANAGER   ]-----"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    echo "-----[  Change permission   ]-----"
    sudo chown -R ubuntu:ubuntu ~/.vim
    # sudo chown -R ubuntu ~/.vim >> ~/.init/log_vim.txt 1>&2

    echo "-----[  INSTALLING VIM COLOR SCHEME   ]-----"
    mkdir -p ~/.vim/colors
    curl -fsSL $REPO_URL/vim/colors/gruvbox.vim -o ~/.vim/colors/gruvbox.vim
}

install_vim_rpi(){
    yes | sudo apt-get install vim

    # ---SETING UP VIM ---
    echo "-----[  OVERWRITING VIMRC CONFIG   ]-----"
    curl -fsSL $REPO_URL/vim/vimrc-rpi -o ~/.vimrc

    echo "-----[  DOWNLOADING VUNDLE - VIM PLUGIN MANAGER   ]-----"
    git clone --no-checkout https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    echo "-----[  Change permission   ]-----"
    sudo chown -R pi:pi ~/.vim
    #sudo chown -R ubuntu ~/.vim >> ~/.init/log_vim.txt 1>&2

    echo "-----[  INSTALLING VIM COLOR SCHEME   ]-----"
    mkdir -p ~/.vim/colors
    curl -fsSL $REPO_URL/vim/colors/gruvbox.vim -o ~/.vim/colors/gruvbox.vim
}

install_vim_mac(){
    echo "vim on mac"    
}

# Start this script
do_install_vim "$@"