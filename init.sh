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
#   $ nohup ~/dotfiles/init.sh 2>&1 > /dev/null &
#
# Debugging:
#   $ bashdb ~/dotfiles/init.sh --os ubuntu
#   then:
#   type "s" to execute each line, type "n" for each top-level function

set -xe

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
}


do_init_ubuntu(){
    echo "CURRENT Linux Distribution: [  Ubuntu  ]. Start initializing system funtionalities..."
    # Add uitility funcitons to bashrc
    #echo "[   ADDING UTILITY FUNCTIONS TO BASHRC   ]"
    #curl -sSL $REPO_URL//utils.sh -o ~/.bashrc.utils
    #cat ~/.bashrc.utils >> ~/.bash_profile
    #source ~/.bash_profile
    #
    # Change server timezone
    echo "[   CHANGE TIMEZONE   ]"
    sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    # Add cron job to auto update dotfiles
    echo "$(crontab -l)\n*/1 * * * * git -C ~/dotfiles pull" | crontab
    # Update server & install essentials
    # echo "[   UPDATE APT REPOSITORIES   ]"
    echo "[   UPDATE APT REPOSITORIES   ]"
    # sudo cp ./etc/ubuntu/sources-cn.list /etc/apt/
    sudo apt-get update 
    # Get essential tools before any installation
    sudo apt-get install curl wget git bashdb -y 
    # Setup Vim
    echo "[   SETTING UP VIM   ]"
    sh $SRC/vim/install_vim.sh --os ubuntu 
    # Setup Tmux
    echo "[   SETTING UP TMUX   ]"
    sh $SRC/tmux/install_tmux.sh --os ubuntu 
    # Setup ZSH
    echo "[   SETTING UP ZSH   ]"
    sh $SRC/zsh/install_zsh.sh --os ubuntu 
    # Setup Python3
    echo "[   SETTING UP PYTHON3   ]"
    sh $SRC/python/install_python3.sh --os ubuntu 
    echo "[   SETTING UP JUPYTER ]"
    sh $SRC/python/install_jupyter.sh --os ubuntu 
    # Install common used apt packages & clean up
    sh $SRC/packageManager/apt.sh --os ubuntu 
    # Install docker
    echo "[    SCRIPT FOR DOCKER   ]"
    sh $SRC/docker/install_docker.sh --os ubuntu 
    sh $SRC/docker/docker-apps.sh --os ubuntu
}

do_init_rpi(){
    echo "CURRENT Linux Distribution: [  Raspbian  ]. Start initializing system funtionalities..."
    echo "[   Overwrite Raspberry Pi Default configs   ]"
    sudo cp ./etc/Rpi/boot/config.txt /boot/config.txt
    # Enable ssh
    sudo touch /boot/ssh
    #
    # Setup WIFI (need you to rewrite wifi password in the file)
    #sudo wget $REPO_URL//Rpi/wpa_supplicant.conf -O /boot/wpa_supplicant.conf
    #
    # Add cron job to auto update dotfiles
    echo "$(crontab -l)\n*/1 * * * * git -C ~/dotfiles pull" | crontab
    #
    echo "[   UPDATE APT REPOSITORIES   ]"
    sudo cp ./etc/Rpi/sources-cn.list /etc/apt/
    sudo apt-get update 2>&1 /dev/null
    # Get essential tools before any installation
    sudo apt-get install curl wget git bashdb -y 
    # Setup Vim
    echo "[   SETTING UP SETTING UP VIM   ]"
    sh $SRC/vim/install_vim.sh --os raspbian  
    # Setup Tmux
    echo "[   SETTING UP SETTING UP TMUX   ]"
    sh $SRC/tmux/install_tmux.sh --os raspbian  
    # Setup ZSH
    echo "[   SETTING UP SETTING UP ZSH   ]"
    sh $SRC/zsh/install_zsh.sh --os raspbian 
    # Setup Python3
    echo "[   SETTING UP SETTING UP PYTHON3   ]"
    sh $SRC/python/install_python3.sh --os raspbian 
    # Install common used apt packages & clean up
    sh $SRC/packageManager/apt.sh --os raspbian 
    # Install docker
    echo "[    SCRIPT FOR DOCKER   ]"
    sh $SRC/docker/install-docker-rpi.sh --os raspbian 
    sh $SRC/docker/docker-apps.sh --os raspbian
}

do_init_mac(){
    echo "CURRENT OS: [  Mac OS X  ]. Start initializing system funtionalities..."
    # Homebrew, always the 1st setup for Mac
    sh $SRC/packageManager/homebrew.sh
    # Xcode
    # .... you want to install that in App Store....
    # 
}




#-------------------------------------
#          Entry points
#-------------------------------------

# Run initial functions by os version
do_init_by_os "$@"

