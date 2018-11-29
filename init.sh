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
#   git clone https://github.com/solomonxie/dotfiles.git && cd dotfiles 
#   nohup ./init.sh 2>&1 > /dev/null &
#
# Debug:
#   $ bashdb init.sh --os ubuntu
#   then:
#   type "s" to execute each line, type "n" for each top-level function

set -ax


ME=${SUDO_USER:-$LOGNAME}
MYHOME=`getent passwd $ME | cut -d: -f 6`
SRC="$MYHOME/dotfiles"
REPO_URL="https://raw.githubusercontent.com/solomonxie/dotfiles/master"
OS=""


do_init_by_os(){
    # Get distro information
    while [ $# -gt 1 ] ;do
        case "$1" in
            "--os")
                OS=$2 
                shift 2;;
            *)
            distro=$(get_distro)
            ;;
        esac
        # Continue next loop
        #shift $(( $# > 0 ? 1 : 0 ))
    done
    if [ "$OS" = "" ]; then
        OS=$(get_distro)
    fi
    # Do different script based on the OS
    case $OS in
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
    # Change server timezone
    echo "[   CHANGE TIMEZONE   ]"
    sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    # Update server & install essentials
    # echo "[   UPDATE APT REPOSITORIES   ]"
    echo "[   UPDATE APT REPOSITORIES   ]"
    # sudo cp ./etc/ubuntu/sources-cn.list /etc/apt/
    sudo apt-get update 2>&1 > /dev/null
    # Get essential tools before any installation
    sudo apt-get install curl wget git bashdb -y 2>&1 > /dev/null
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
    sh $SRC/python/install_python3.sh --os ubuntu 2>&1 > /dev/null
    echo "[   SETTING UP JUPYTER ]"
    sh $SRC/python/install_jupyter.sh --os ubuntu 2>&1 > /dev/null
    # Install common used apt packages & clean up
    sh $SRC/packageManager/apt.sh --os ubuntu 2>&1 > /dev/null
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
    # Setup WIFI (need you to rewrite wifi password in the file)
    #sudo wget $REPO_URL//Rpi/wpa_supplicant.conf -O /boot/wpa_supplicant.conf
    # Update server & install essentials
    echo "[   UPDATE APT REPOSITORIES   ]"
    sudo cp ./etc/Rpi/sources-cn.list /etc/apt/
    sudo apt-get update 2>&1 /dev/null
    # Get essential tools before any installation
    sudo apt-get install curl wget git bashdb -y 2>&1 > /dev/null
    # Setup Vim
    echo "[   SETTING UP SETTING UP VIM   ]"
    sh $SRC/vim/install_vim.sh --os raspbian
    # Setup Tmux
    echo "[   SETTING UP SETTING UP TMUX   ]"
    sh $SRC/tmux/install_tmux.sh --os raspbian
    # Setup ZSH
    echo "[   SETTING UP SETTING UP ZSH   ]"
    sh $SRC/python/install_zsh.sh --os raspbian
    # Setup Python3
    echo "[   SETTING UP SETTING UP PYTHON3   ]"
    sh $SRC/python/install_python3.sh --os raspbian 2>&1 > /dev/null
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


get_distro(){
    local distro=""
    if [ -x "$(command -v lsb_release)" ]; then #Linux
        distro=$(lsb_release -si | tr '[:upper:]' '[:lower:]')
    elif [ -x "$(command -v sw_vers)" ]; then #MacOS
        #distro=$(sw_vers -productName)
        distro="mac"
    elif [ -x "$(command -v uname)" ]; then #Others
        local info=$(uname -a | tr '[:upper:]' '[:lower:]')
        if [[ $info == *"Darwin"* ]]; then
            distro="mac"
        elif [[ $info == *"ubuntu"* ]]; then
            distro="ubuntu"
        elif [[ $info == *"raspberrypi"* ]]; then
            distro="raspbian"
        elif [[ $info == *"linux"* ]]; then
            distro="linux"
        else
            distro="OTHERS"
        fi
    fi
    echo $distro
}

get_os(){
    case $(get_distro) in
        "ubuntu")
            echo "CURRENT Linux Distribution: [  Ubuntu  ].";;
        "raspbian")
            echo "CURRENT Linux Distribution: [  Raspbian  ].";;
        "mac")
            echo "CURRENT OS: [  Mac OS X  ].";;
    esac
}

# Run initial functions by os version
do_init_by_os "$@"

