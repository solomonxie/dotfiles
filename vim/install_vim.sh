#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Raspbian / MacOS Sierra
# Commands:
#   1. Get in VIM
#   2. :PluginInstall
#   3. If there's permission problem: $ sudo chown -R $USER:$USER ~/.vim
#   4. :PluginInstall

set -x


do_install_vim(){
    # Load uitility functions (check os)
    curl -fsSL https://raw.githubusercontent.com/solomonxie/dotfiles/master/utils.sh -o $HOME/.bash-utils.sh
    source $HOME/.bash-utils.sh
    
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
    mkdir ~/.vim
    export VIM="~/.vim"

    yes | sudo apt-get install vim

    # ---SETING UP VIM ---
    echo "-----[  OVERWRITING VIMRC CONFIG   ]-----"
    cp ./vimrc-ubuntu ~/.vimrc

    echo "-----[  DOWNLOADING VUNDLE - VIM PLUGIN MANAGER   ]-----"
    git clone --no-checkout https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    echo "-----[  Change permission   ]-----"
    sudo chown -R ubuntu:ubuntu ~/.vim
    # sudo chown -R ubuntu ~/.vim >> ~/.init/log_vim.txt 1>&2

    echo "-----[  INSTALLING VIM COLOR SCHEME   ]-----"
    mkdir ~/.vim/colors
    cp ./colors/gruvbox.vim ~/.vim/colors/
}

install_vim_rpi(){
    mkdir ~/.vim
    export VIM=~/.vim

    yes | sudo apt-get install vim

    # ---SETING UP VIM ---
    echo "-----[  OVERWRITING VIMRC CONFIG   ]-----"
    cp ./vimrc-rpi ~/.vimrc

    echo "-----[  DOWNLOADING VUNDLE - VIM PLUGIN MANAGER   ]-----"
    git clone --no-checkout https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    echo "-----[  Change permission   ]-----"
    sudo chown -R pi:pi ~/.vim
    #sudo chown -R ubuntu ~/.vim >> ~/.init/log_vim.txt 1>&2

    echo "-----[  INSTALLING VIM COLOR SCHEME   ]-----"
    mkdir ~/.vim/colors
    cp ./colors/gruvbox.vim ~/.vim/colors/
}

install_vim_mac(){
    echo "vim on mac"    
}

# Start this script
do_install_vim