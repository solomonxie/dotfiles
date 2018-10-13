#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu / Raspbian / MacOS Sierra

do_install_vim_ubuntu(){
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

do_install_vim_rpi(){
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

do_install_vim_mac(){
    
}
