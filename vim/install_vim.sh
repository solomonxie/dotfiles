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
#   $ ./install_vim.sh --os ubuntu
# Debug:
#   $ bashdb ./install_vim.sh --os ubuntu


set -ax

MYHOME=${$(`getent passwd ${SUDO_UID:-$(id -u)} | cut -d: -f 6`):-$HOME}
REPO_URL="git@github.com:solomonxie/dotfiles.git"
SRC="$MYHOME/dotfiles"

# Download Repo if not exists
if [ ! -e $MYHOME/dotfiles ]; then
    git clone $REPO_URL $MYHOME/dotfiles
fi

# Check flags
if [ $# -eq 0 ]; then 
    echo "[ Failed ] Please specify OS version with --os flag."
    return 1; 
fi

#-------------------------------------
#     Installation Methods
#-------------------------------------

do_install_vim(){
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
    mkdir -p $MYHOME/.vim
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
    curl -fsSL $SRC/vim/colors/gruvbox.vim -o $MYHOME/.vim/colors/gruvbox.vim
    # Syntax files
    echo "-----[  INSTALLING VIM SYNTAX  ]-----"
    mkdir -p $MYHOME/.vim/syntax
    curl -fsSL $SRC/vim/syntax/python.vim -o $MYHOME/.vim/syntax/python.vim
    # Download Vundle & Install plugins
    echo "-----[  DOWNLOADING VIM PLUGIN MANAGER   ]-----"
    curl -fLo $MYHOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall

    echo "-----[   Create Symlinks   ]-----"
    ln -sf $MYHOME/dotfiles/vim/vimrc $MYHOME/.vimrc
}

install_vim_ubuntu(){
    sudo apt-get install vim -y

    # Plugin dependencies
    sudo apt-get install ctags -y

    echo "-----[  Change permission   ]-----"
    sudo chown -R ubuntu:ubuntu $MYHOME/.vim
    # sudo chown -R ubuntu $MYHOME/.vim >> $MYHOME/.init/log_vim.txt 1>&2

}

install_vim_rpi(){
    yes | sudo apt-get install vim

    # Plugin dependencies
    sudo apt-get install ctags -y

    echo "-----[  Change permission   ]-----"
    sudo chown -R pi:pi $MYHOME/.vim
    #sudo chown -R ubuntu $MYHOME/.vim >> $MYHOME/.init/log_vim.txt 1>&2
}

install_vim_mac(){
    brew install vim

    # Install plugin dependencies
    brew install ctags
    brew install --HEAD universal-ctags/universal-ctags/universal-ctags
}

build_vim_pi(){
    # Download
    cd /tmp
    wget https://github.com/vim/vim/archive/v8.1.0561.tar.gz
    tar -xzvf v8.1.0561.tar.gz
    cd vim-8.1.0561

    # Install / Download Language support libraries
    sudo apt-get install -y libncurses5-dev liblua5.3-dev libperl-dev python-dev python3-dev ruby-dev

    # Fix lua paths
    sudo mv $(which lua) "$(which lua)_old"
    sudo ln -s /usr/bin/lua5.3 /usr/bin/lua
    sudo ln -s /usr/include/lua5.3 /usr/include/lua
    sudo ln -s /usr/lib/arm-linux-gnueabihf/liblua5.3.so /usr/local/lib/liblua.so

    # Fix python paths
    sudo ln -s /usr/lib/python2.7/config-arm-linux-gnueabihf /usr/lib/python2.7/config
    sudo ln -s /usr/lib/python3.4/config-3.4m-arm-linux-gnueabihf /usr/lib/python3.4/config

    # Get language support paths
    # For Mac
    #py2="/usr/lib/python2.7/config"
    #py3="/usr/local/Cellar/python/3.7.0/Frameworks/Python.framework/Versions/3.7/lib/python3.7/config-3.7m-darwin"
    #lua="/usr/local/Cellar/lua/5.3.5_1"
    # For Rpi
    #py2="/usr/lib/python2.7/config-arm-linux-gnueabihf"
    #py3="/usr/lib/python3.4/config-3.4m-arm-linux-gnueabihf"
    #lua="/usr/lib"

    # Build
    ./configure \
        --prefix=/opt/vim-8.1 \
        --enable-gui=auto \
        --enable-luainterp \
        --enable-python3interp \
        --enable-pythoninterp=dynamic \
        --enable-perlinterp=dynamic \
        --enable-rubyinterp=dynamic \
        --enable-cscope \
        --enable-multibyte \
        --enable-fontset \
        --enable-largefile \
        --enable-fail-if-missing \
        --with-features=huge \
        --with-python-config-dir=/usr/lib/python2.7/config \
        --with-python3-config-dir=/usr/lib/python3.4/config \
        --disable-netbeans && \
        echo '[ OK ]'

    make && sudo make install && echo '[ OK ]'

    # Replace VIM in old version with new
    sudo mv $(which vim) "$(which vim)_old"
    sudo ln -s /opt/vim-8.1/bin/vim /usr/bin/vim
}


#-------------------------------------
#          Entry points
#-------------------------------------

do_install_vim "$@"