#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu / Raspbian / MacOS
# Notice: 
# How to run this script:
#   git clone https://github.com/solomonxie/cdn.git
#   cd ./cdn
#   sudo ./init.sh >> /var/log/sys_init.log

set -x

do_init_by_os(){
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

do_init_ubuntu(){
    echo "CURRENT Linux Distribution: [  Ubuntu  ]. Start initializing system funtionalities..."
    # Add uitility funcitons to bashrc
    #echo "[   ADDING UTILITY FUNCTIONS TO BASHRC   ]"
    #curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/utils.sh -o $HOME/.bashrc.utils
    #cat $HOME/.bashrc.utils >> $HOME/.bash_profile
    #source $HOME/.bash_profile
    # Change server timezone
    echo "[   CHANGE TIMEZONE   ]"
    sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    # Update server & install essentials
    # echo "[   UPDATE APT REPOSITORIES   ]"
    echo "[   UPDATE APT REPOSITORIES   ]"
    # sudo cp ./etc/ubuntu/sources-cn.list /etc/apt/
    yes | sudo apt-get update
    # Get essential tools before any installation
    yes |sudo apt-get install curl wget git
    # Setup Python3
    echo "[   SETTING UP PYTHON3   ]"
    sh ./python/install_python3.sh --distro ubuntu
    # Setup ZSH
    echo "[   SETTING UP ZSH   ]"
    sh ./zsh/install_zsh.sh --distro ubuntu
    # Setup Vim
    echo "[   SETTING UP VIM   ]"
    sh ./vim/install_vim.sh --distro ubuntu
    # Setup Tmux
    echo "[   SETTING UP TMUX   ]"
    sh ./tmux/install_tmux.sh --distro ubuntu
    # Install docker
    echo "[    SCRIPT FOR DOCKER   ]"
    curl -fsSL get.docker.com -o get-docker.sh && sudo sh get-docker.sh
    # sh ./docker/install-docker-ubuntu.sh
    # Install common used apt packages & clean up
    sh ./package-manager/apt.sh --distro ubuntu
}

do_init_rpi(){
    echo "CURRENT Linux Distribution: [  Raspbian  ]. Start initializing system funtionalities..."
    echo "[   Overwrite Raspberry Pi Default configs   ]"
    sudo cp ./etc/Rpi/boot/config.txt /boot/config.txt
    # Enable ssh
    sudo touch /boot/ssh
    # Setup WIFI (need you to rewrite wifi password in the file)
    #sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/wpa_supplicant.conf -O /boot/wpa_supplicant.conf
    # Update server & install essentials
    echo "[   UPDATE APT REPOSITORIES   ]"
    sudo cp ./etc/Rpi/sources-cn.list /etc/apt/
    yes | sudo apt-get update
    # Setup Python3
    echo "[   SETTING UP SETTING UP PYTHON3   ]"
    sh ./python/install_python3.sh --distro ubuntu
    # Setup ZSH
    echo "[   SETTING UP SETTING UP ZSH   ]"
    sh ./python/install_zsh.sh
    # Setup Vim
    echo "[   SETTING UP SETTING UP VIM   ]"
    sh ./vim/install_vim.sh
    # Setup Tmux
    echo "[   SETTING UP SETTING UP TMUX   ]"
    sh ./tmux/install_tmux.sh
    # Install docker
    echo "[    SCRIPT FOR DOCKER   ]"
    curl -fsSL get.docker.com -o get-docker.sh && sudo sh get-docker.sh
    # sh ./docker/install-docker-rpi.sh
    # Install common used apt packages & clean up
    sh ./package-manager/apt.sh 
}

do_init_mac(){
    echo "CURRENT OS: [  Mac OS X  ]. Start initializing system funtionalities..."
}

# Run initial functions by os version
do_init_by_os

