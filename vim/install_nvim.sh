#! /bin/bash
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Raspbian / MacOS Sierra
#
# Commands:
#   1. Get in VIM
#   2. :PlugInstall
#   3. If there's permission problem: $ sudo chown -R $USER:$USER ~/.vim
#   4. :PlugInstall
#
# Run:
#   $ ./install_nvim.sh --os ubuntu
# Debug:
#   $ bashdb ./install_nvim.sh --os ubuntu


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

do_install_nvim(){
    # Do different things with different OS
    case $MYOS in
        ubuntu)
            install_nvim_ubuntu ;;
        raspbian)
            build_nvim_pi
            ;;
        mac)
            # build_nvim_mac
            brew install neovim
            ;;
    esac

    # Make paths for vim extensions
    mkdir -p $HOME/.vim
    ln -s $HOME/.vim $HOME/.config/nvim

    # Color Scheme
    echo "-----[  INSTALLING VIM COLOR SCHEME   ]-----"
    mkdir -p $HOME/.vim/colors
    cp $HOME/dotfiles/vim/colors/gruvbox.vim $HOME/.vim/colors/gruvbox.vim

    # Syntax files
    echo "-----[  INSTALLING VIM SYNTAX  ]-----"
    mkdir -p $HOME/.vim/syntax
    cp $HOME/dotfiles/vim/syntax/python.vim $HOME/.vim/syntax/python.vim

    # Download Vundle & Install plugins
    echo "-----[  DOWNLOADING VIM PLUGIN MANAGER   ]-----"
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall

    echo "-----[   Create Symlinks   ]-----"
    ln -sf $HOME/dotfiles/vim/vimrc $HOME/.vimrc
    ln -sf $HOME/dotfiles/vim/vimrc $HOME/.config/nvim/init.vim
}

build_nvim_mac(){
    cd /tmp/
    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
    tar xzf nvim-macos.tar.gz
    ./nvim-osx64/bin/nvim
    sudo mv nvim-osx64 /opt/nvim
    sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
}

install_nvim_ubuntu(){
    yes | sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install -y neovim
    sudo apt-get install python-dev python-pip python3-dev python3-pip
}

build_nvim_pi(){
    # Package Manager is currently not supporting nvim on Rpi
    cd /tmp
    git clone https://github.com/neovim/neovim.git
    cd neovim
    git checkout v0.3.1
    rm -r build/  # clear the CMake cache
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/opt/neovim" && \
    sudo make install && echo '[ OK ]'
}





#-------------------------------------
#          Entry points
#-------------------------------------

do_install_nvim "$@"
