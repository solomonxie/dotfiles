#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu / Raspbian / MacOS
# Notice: 
# How to run this script:
#    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/init.sh | sudo sh >> /tmp/init.log

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
    # sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/ubuntu/sources-cn.list -O /etc/apt/sources.list
    echo "[   UPDATE APT REPOSITORIES   ]"
    yes | sudo apt-get update
    # Get essential tools before any installation
    yes |sudo apt-get install curl wget git
    # Setup Python3
    echo "[   SETTING UP PYTHON3   ]"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/python/install_python3.sh | sudo sh
    # Setup ZSH
    echo "[   SETTING UP ZSH   ]"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/zsh/install-zsh-ubuntu.sh | sudo sh
    # Setup Vim
    echo "[   SETTING UP VIM   ]"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/vim/install-vim-ubuntu.sh | sudo sh
    # Setup Tmux
    echo "[   SETTING UP TMUX   ]"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/tmux/install-tmux-ubuntu.sh | sudo sh
    # Install docker
    echo "[    SCRIPT FOR DOCKER   ]"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/docker/install-docker-ubuntu.sh | sudo sh
    # Install common used apt packages & clean up
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/package-manager/apt.sh | sudo sh
}

do_init_rpi(){
    echo "CURRENT Linux Distribution: [  Raspbian  ]. Start initializing system funtionalities..."
    echo "[   Overwrite Raspberry Pi Default configs   ]"
    sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/Rpi/boot/config.txt -O /boot/config.txt
    # Enable ssh
    sudo touch /boot/ssh
    # Setup WIFI (need you to rewrite wifi password in the file)
    #sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/wpa_supplicant.conf -O /boot/wpa_supplicant.conf
    # Update server & install essentials
    echo "[   UPDATE APT REPOSITORIES   ]"
    sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/Rpi/sources.list -O /etc/apt/sources.list
    yes | sudo apt-get update
    # Setup Python3
    echo "[   SETTING UP SETTING UP PYTHON3   ]"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/python/isntall_python3.sh | sudo sh
    # Setup ZSH
    echo "[   SETTING UP SETTING UP ZSH   ]"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/zsh/zsh-setup-rpi.sh | sudo sh
    # Setup Vim
    echo "[   SETTING UP SETTING UP VIM   ]"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/vim/vim-setup-rpi.sh | sudo sh
    # Setup Tmux
    echo "[   SETTING UP SETTING UP TMUX   ]"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/tmux/tmux-setup-rpi.sh | sudo sh
    # Install docker
    echo "[    SCRIPT FOR DOCKER   ]"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/docker/install-docker-rpi.sh | sudo sh
}

do_init_mac(){
    echo "CURRENT OS: [  Mac OS X  ]. Start initializing system funtionalities..."
}

# Run initial functions by os version
do_init_by_os

