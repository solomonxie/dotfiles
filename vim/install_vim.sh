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

ME=${SUDO_USER:-$LOGNAME}
MYHOME=`getent passwd $ME | cut -d: -f 6`
REPO_URL="https://raw.githubusercontent.com/solomonxie/dotfiles/master"

mkdir $MYHOME/.vim


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
    # Color Scheme
    echo "-----[  INSTALLING VIM COLOR SCHEME   ]-----"
    mkdir -p $MYHOME/.vim/colors
    curl -fsSL $REPO_URL/vim/colors/gruvbox.vim -o $MYHOME/.vim/colors/gruvbox.vim
    # Download Vundle & Install plugins
    echo "-----[  DOWNLOADING VUNDLE - VIM PLUGIN MANAGER   ]-----"
    git clone https://github.com/VundleVim/Vundle.vim.git $MYHOME/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
}

install_vim_ubuntu(){
    sudo apt-get install vim -y

    # ---SETING UP VIM ---
    echo "-----[  OVERWRITING VIMRC CONFIG   ]-----"
    curl -fsSL $REPO_URL/vim/vimrc-ubuntu -o $MYHOME/.vimrc

    echo "-----[  Change permission   ]-----"
    sudo chown -R ubuntu:ubuntu $MYHOME/.vim
    # sudo chown -R ubuntu $MYHOME/.vim >> $MYHOME/.init/log_vim.txt 1>&2
}

install_vim_rpi(){
    yes | sudo apt-get install vim

    # ---SETING UP VIM ---
    echo "-----[  OVERWRITING VIMRC CONFIG   ]-----"
    curl -fsSL $REPO_URL/vim/vimrc-rpi -o $MYHOME/.vimrc

    echo "-----[  Change permission   ]-----"
    sudo chown -R pi:pi $MYHOME/.vim
    #sudo chown -R ubuntu $MYHOME/.vim >> $MYHOME/.init/log_vim.txt 1>&2
}

install_vim_mac(){
    brew install vim

    # ---SETING UP VIM ---
    echo "-----[  OVERWRITING VIMRC CONFIG   ]-----"
    curl -fsSL $REPO_URL/vim/vimrc-mac -o ~/.vimrc
}

# Start this script
do_install_vim "$@"