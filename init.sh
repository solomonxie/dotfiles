#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# ENVIRONMENT: Ubuntu / Raspbian / MacOS
# NOTICE: 
#   This script shouldn't be run as ROOT user,
#   please don't abuse "sudo" on top of this script.
#   Run this as ROOT results apps installed to wrong paths.
#
# How to run this script:
#   git clone https://github.com/solomonxie/dotfiles.git ~/dotfiles 
#   ~/dotfiles/init.sh
#   #or
#   $ nohup ~/dotfiles/init.sh > /dev/null 2>&1 &
#
# Debugging:
#   $ bashdb ~/dotfiles/init.sh --os ubuntu
#   then:
#   type "s" to execute each line, type "n" for each top-level function

set -x

# Setup env variables and shared functions
source `dirname $0`/dotfiles.env


#-------------------------------------
#     Initialization Functions
#-------------------------------------

do_init_by_os(){
    # Do different script based on the OS
    case $MYOS in
        ubuntu)
            do_init_ubuntu ;;
        raspbian)
            do_init_rpi ;;
        mac)
            do_init_mac ;;
    esac
    export EDITOR=$(which vim)
    echo "[   CHANGE TIMEZONE   ]"
    sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime > /dev/null 2>&1
}


do_init_ubuntu(){
    echo "CURRENT Linux Distribution: [  Ubuntu  ]. Start initializing system funtionalities..."
    # Add uitility funcitons to bashrc
    #echo "[   ADDING UTILITY FUNCTIONS TO BASHRC   ]"
    #curl -sSL $REPO_URL//utils.sh -o ~/.bashrc.utils
    #cat ~/.bashrc.utils >> ~/.bash_profile
    #source ~/.bash_profile
    #
    echo "[   ADD CRON JOB TO PULL DOTFILES   ]"
    #echo "$(crontab -l)*/1 * * * * git -C ~/dotfiles pull" | crontab
    echo "*/1 * * * * git -C ~/dotfiles pull" | crontab
    # Update server & install essentials
    # echo "[   UPDATE APT REPOSITORIES   ]"
    echo "[   UPDATE APT REPOSITORIES   ]"
    # sudo cp ./etc/ubuntu/sources-cn.list /etc/apt/
    sudo apt-get update 
    # Get essential tools before any installation
    echo "[   INSTALL ESSENTIAL SOFTWARES   ]"
    sudo apt-get install curl wget git bashdb -y 
    # Setup Python3
    echo "[   INSTALL PYTHON   ]"
    $SRC/python/install_python.sh
    # Setup Vim
    echo "[   INSTALL VIM   ]"
    $SRC/vim/install_vim.sh
    # Setup Tmux
    echo "[   INSTALL TMUX   ]"
    $SRC/tmux/install_tmux.sh
    # Setup ZSH
    echo "[   INSTALL ZSH   ]"
    $SRC/zsh/install_zsh.sh
    # Install common used apt packages & clean up
    $SRC/pacman/apt.sh
    # Install docker
    echo "[    SCRIPT FOR DOCKER   ]"
    $SRC/docker/install_docker.sh
    $SRC/docker/docker-apps.sh
}

do_init_rpi(){
    echo "CURRENT Linux Distribution: [  Raspbian  ]. Start initializing system funtionalities..."
    echo "[   Overwrite Raspberry Pi Default configs   ]"
    #sudo cp ./etc/Rpi/boot/config.txt /boot/config.txt
    # Enable ssh
    sudo touch /boot/ssh
    #
    # Setup WIFI (need you to rewrite wifi password in the file)
    #sudo wget $REPO_URL//Rpi/wpa_supplicant.conf -O /boot/wpa_supplicant.conf
    #
    # Add cron job to auto update dotfiles
    echo "*/1 * * * * git -C ~/dotfiles pull" | crontab
    #
    echo "[   UPDATE APT REPOSITORIES   ]"
    #sudo cp ./etc/Rpi/sources-cn.list /etc/apt/
    sudo apt-get update
    # Get essential tools before any installation
    sudo apt-get install curl wget git bashdb -y 
    # Setup Python3
    echo "[   INSTALL INSTALL PYTHON3   ]"
    $SRC/python/install_python3.sh
    # Setup Vim
    echo "[   INSTALL INSTALL VIM   ]"
    $SRC/vim/install_vim.sh
    # Setup Tmux
    echo "[   INSTALL INSTALL TMUX   ]"
    $SRC/tmux/install_tmux.sh
    # Setup ZSH
    echo "[   INSTALL INSTALL ZSH   ]"
    $SRC/zsh/install_zsh.sh
    # Install common used apt packages & clean up
    $SRC/pacman/apt.sh
    # Install docker
    echo "[    SCRIPT FOR DOCKER   ]"
    $SRC/docker/install-docker-rpi.sh
    $SRC/docker/docker-apps.sh
}

do_init_mac(){
    echo "CURRENT OS: [  Mac OS X  ]. Start initializing system funtionalities..."
    # Homebrew, always the 1st setup for Mac
    sh $SRC/pacman/homebrew.sh
    # Xcode
    # .... you want to install that in App Store....
    # 
    # Fonts
    brew cask install font-hack-nerd-font
}




#-------------------------------------
#          Entry points
#-------------------------------------

# Run initial functions by os version
do_init_by_os "$@" 2>/tmp/init-error.log

