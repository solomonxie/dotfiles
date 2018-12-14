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

ME=${SUDO_USER:-$(id -un)}
HOUSE="`cat /etc/passwd |grep ^${ME}: | cut -d: -f 6`"
HOUSE=${HOUSE:-$HOME}
echo $HOUSE
REPO_URL="git@github.com:solomonxie/dotfiles.git"
SRC="$HOUSE/dotfiles"

# Download Repo if not exists
if [ ! -e $HOUSE/dotfiles ]; then
    git clone $REPO_URL $HOUSE/dotfiles
fi

# Check flags
if [ $# -eq 0 ]; then 
    echo "[ Failed ] Please specify OS version with --os flag."
    return 1; 
fi

#-------------------------------------
#     Installation Methods
#-------------------------------------

do_install_nvim(){
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
    # Make paths for vim extensions
    mkdir -p $HOUSE/.vim
    ln -s $HOUSE/.vim $HOUSE/.config/nvim
    # Do different things with different OS
    case $OS in
        ubuntu)
            install_vim_ubuntu ;;
        raspbian)
            build_nvim_pi ;;
        mac)
            install_vim_mac ;;
    esac
    # Color Scheme
    echo "-----[  INSTALLING VIM COLOR SCHEME   ]-----"
    mkdir -p $HOUSE/.vim/colors
    curl -fsSL $SRC/vim/colors/gruvbox.vim -o $HOUSE/.vim/colors/gruvbox.vim
    # Syntax files
    echo "-----[  INSTALLING VIM SYNTAX  ]-----"
    mkdir -p $HOUSE/.vim/syntax
    curl -fsSL $SRC/vim/syntax/python.vim -o $HOUSE/.vim/syntax/python.vim
    # Download Vundle & Install plugins
    echo "-----[  DOWNLOADING VIM PLUGIN MANAGER   ]-----"
    curl -fLo $HOUSE/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall

    echo "-----[   Create Symlinks   ]-----"
    ln -sf $HOUSE/dotfiles/vim/vimrc $HOUSE/.vimrc
    ln -sf $HOUSE/dotfiles/vim/vimrc $HOUSE/.config/nvim/init.vim
}

install_nvim_mac(){
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