#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# ENVIRONMENT: Ubuntu / Raspbian / MacOS
# NOTICE: 
# How to run this script:
#   git clone https://github.com/solomonxie/dotfiles.git && cd ./dotfiles && sudo ./init.sh >> /tmp/sys_init.log

set -x

REPO_ROOT="https://raw.githubusercontent.com/solomonxie/dotfiles/master"
SRC=$PWD


do_init_by_os(){
    # Load uitility functions (check os)
    curl -fsSL $REPO_ROOT/utils.sh -o $HOME/.bash-utils.sh
    source $HOME/.bash-utils.sh

    # Get Distro
    case $(get_distro) in
        "ubuntu")
            do_init_ubuntu ;;
        "raspbian")
            do_init_rpi ;;
        "mac")
            do_init_mac ;;
    esac
}


do_init_ubuntu(){
    echo "CURRENT Linux Distribution: [  Ubuntu  ]. Start initializing system funtionalities..."
    # Add uitility funcitons to bashrc
    #echo "[   ADDING UTILITY FUNCTIONS TO BASHRC   ]"
    #curl -sSL $REPO_ROOT//utils.sh -o $HOME/.bashrc.utils
    #cat $HOME/.bashrc.utils >> $HOME/.bash_profile
    #source $HOME/.bash_profile
    # Change server timezone
    echo "[   CHANGE TIMEZONE   ]"
    sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    # Update server & install essentials
    # echo "[   UPDATE APT REPOSITORIES   ]"
    echo "[   UPDATE APT REPOSITORIES   ]"
    # sudo cp ./etc/ubuntu/sources-cn.list /etc/apt/
    sudo apt-get update
    # Get essential tools before any installation
    sudo apt-get install curl wget git -y
    # Setup Python3
    echo "[   SETTING UP PYTHON3   ]"
    sh $SRC/python/install_python3.sh
    # Setup ZSH
    echo "[   SETTING UP ZSH   ]"
    sh $SRC/zsh/install_zsh.sh
    # Setup Vim
    echo "[   SETTING UP VIM   ]"
    sh $SRC/vim/install_vim.sh
    # Setup Tmux
    echo "[   SETTING UP TMUX   ]"
    sh $SRC/tmux/install_tmux.sh
    # Install docker
    echo "[    SCRIPT FOR DOCKER   ]"
    curl -fsSL get.docker.com -o get-docker.sh && sudo sh get-docker.sh
    #sh ./docker/install-docker-ubuntu.sh
    # Install common used apt packages & clean up
    sh $SRC/packageManager/apt.sh
}

do_init_rpi(){
    echo "CURRENT Linux Distribution: [  Raspbian  ]. Start initializing system funtionalities..."
    echo "[   Overwrite Raspberry Pi Default configs   ]"
    sudo cp ./etc/Rpi/boot/config.txt /boot/config.txt
    # Enable ssh
    sudo touch /boot/ssh
    # Setup WIFI (need you to rewrite wifi password in the file)
    #sudo wget $REPO_ROOT//Rpi/wpa_supplicant.conf -O /boot/wpa_supplicant.conf
    # Update server & install essentials
    echo "[   UPDATE APT REPOSITORIES   ]"
    sudo cp ./etc/Rpi/sources-cn.list /etc/apt/
    sudo apt-get update
    # Setup Python3
    echo "[   SETTING UP SETTING UP PYTHON3   ]"
    sh $SRC/python/install_python3.sh --distro ubuntu
    # Setup ZSH
    echo "[   SETTING UP SETTING UP ZSH   ]"
    sh $SRC/python/install_zsh.sh
    # Setup Vim
    echo "[   SETTING UP SETTING UP VIM   ]"
    sh $SRC/vim/install_vim.sh
    # Setup Tmux
    echo "[   SETTING UP SETTING UP TMUX   ]"
    sh $SRC/tmux/install_tmux.sh
    # Install docker
    echo "[    SCRIPT FOR DOCKER   ]"
    curl -fsSL get.docker.com -o get-docker.sh && sudo sh get-docker.sh
    # sh ./docker/install-docker-rpi.sh
    # Install common used apt packages & clean up
    sh $SRC/packageManager/apt.sh 
}

do_init_mac(){
    echo "CURRENT OS: [  Mac OS X  ]. Start initializing system funtionalities..."
}

# Run initial functions by os version
do_init_by_os

