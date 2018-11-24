#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# ENVIRONMENT: Ubuntu / Raspbian / MacOS
# NOTICE: 
# How to run this script:
#   $ git clone https://github.com/solomonxie/dotfiles.git && cd ./dotfiles 
#   $ sudo ./init.sh 2>&1 > /dev/null
#
# Debug:
#   $ bashdb init.sh --distro ubuntu
#   then:
#   type "s" to execute each line, type "n" for each top-level function

set -ax

REPO_ROOT="https://raw.githubusercontent.com/solomonxie/dotfiles/master"
SRC=$PWD

do_init_by_os(){
    # Get distro information
    distro=""
    while [ $# -gt 1 ] ;do
        case "$1" in
            "--distro")
                distro=$2 
                shift 2;;
            *)
            distro=$(get_distro)
            ;;
        esac
        # Continue next loop
        #shift $(( $# > 0 ? 1 : 0 ))
    done
    if [ "$distro" = "" ]; then
        distro=$(get_distro)
    fi
    # Do different script based on the OS
    case $distro in
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
    sudo apt-get install curl wget git bashdb -y
    # Setup Vim
    echo "[   SETTING UP VIM   ]"
    sudo sh $SRC/vim/install_vim.sh --distro ubuntu
    # Setup Tmux
    echo "[   SETTING UP TMUX   ]"
    sudo sh $SRC/tmux/install_tmux.sh --distro ubuntu
    # Setup ZSH
    echo "[   SETTING UP ZSH   ]"
    sudo sh $SRC/zsh/install_zsh.sh --distro ubuntu
    # Setup Python3
    echo "[   SETTING UP PYTHON3   ]"
    sudo sh $SRC/python/install_python3.sh --distro ubuntu
    echo "[   SETTING UP JUPYTER ]"
    sudo sh $SRC/python/install_jupyter.sh --distro ubuntu
    # Install common used apt packages & clean up
    sudo sh $SRC/packageManager/apt.sh --distro ubuntu
    # Install docker
    echo "[    SCRIPT FOR DOCKER   ]"
    # curl -fsSL get.docker.com -o /tmp/get-docker.sh && sudo sh /tmp/get-docker.sh
    sudo sh $SRC/docker/install_docker.sh --distro ubuntu
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
    # Get essential tools before any installation
    sudo apt-get install curl wget git bashdb -y
    # Setup Vim
    echo "[   SETTING UP SETTING UP VIM   ]"
    sudo sh $SRC/vim/install_vim.sh --distro raspbian
    # Setup Tmux
    echo "[   SETTING UP SETTING UP TMUX   ]"
    sudo sh $SRC/tmux/install_tmux.sh --distro raspbian
    # Setup ZSH
    echo "[   SETTING UP SETTING UP ZSH   ]"
    sudo sh $SRC/python/install_zsh.sh --distro raspbian
    # Setup Python3
    echo "[   SETTING UP SETTING UP PYTHON3   ]"
    sh $SRC/python/install_python3.sh --distro raspbian
    # Install common used apt packages & clean up
    sudo sh $SRC/packageManager/apt.sh --distro raspbian
    # Install docker
    echo "[    SCRIPT FOR DOCKER   ]"
    sudo sh $SRC/docker/install-docker-rpi.sh
    sudo sh $SRC/docker/docker-apps.sh --distro raspbian
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
        elif [[ $info == *"Ubuntu"* ]]; then
            distro="ubuntu"
        elif [[ $info == *"raspberrypi"* ]]; then
            distro="raspbian"
        elif [[ $info == *"Linux"* ]]; then
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

