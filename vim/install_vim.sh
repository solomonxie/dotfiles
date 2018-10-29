#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu / Raspbian / MacOS Sierra
# Commands:
#   1. Get in VIM
#   2. :PluginInstall
#   3. If there's permission problem: $ sudo chown -R $USER:$USER ~/.vim
#   4. :PluginInstall

set -x

# Load uitility functions (check os)
curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/utils.sh -o /tmp/utils.sh
source /tmp/utils.sh

do_install_vim(){
    # Get Distro
    distro=$(get_distro)
    case distro in
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

    # ---SETING UP VIM ---
    echo "-----[  OVERWRITING VIMRC CONFIG   ]-----"
    wget https://github.com/solomonxie/cdn/raw/master/vim/vimrc-ubuntu -O ~/.vimrc

    echo "-----[  DOWNLOADING VUNDLE - VIM PLUGIN MANAGER   ]-----"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    echo "-----[  Change permission   ]-----"
    sudo chown -R ubuntu:ubuntu ~/.vim
    # sudo chown -R ubuntu ~/.vim >> ~/.init/log_vim.txt 1>&2

    echo "-----[  INSTALLING VIM COLOR SCHEME   ]-----"
    mkdir ~/.vim/colors
    curl https://raw.githubusercontent.com/solomonxie/cdn/master/vim/colors/gruvbox.vim --create-dirs -o ~/.vim/colors/gruvbox.vim 
}

install_vim_rpi(){
    mkdir ~/.vim
    export VIM=~/.vim

    # ---SETING UP VIM ---
    echo "-----[  OVERWRITING VIMRC CONFIG   ]-----"
    wget https://github.com/solomonxie/cdn/raw/master/vim/vimrc-rpi -O ~/.vimrc

    echo "-----[  DOWNLOADING VUNDLE - VIM PLUGIN MANAGER   ]-----"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    echo "-----[  Change permission   ]-----"
    sudo chown -R pi:pi ~/.vim
    #sudo chown -R ubuntu ~/.vim >> ~/.init/log_vim.txt 1>&2

    echo "-----[  INSTALLING VIM COLOR SCHEME   ]-----"
    mkdir ~/.vim/colors
    curl https://raw.githubusercontent.com/solomonxie/cdn/master/vim/colors/gruvbox.vim --create-dirs -o ~/.vim/colors/gruvbox.vim 
}

install_vim_mac(){
    echo "vim on mac"    
}
