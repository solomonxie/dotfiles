#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu / Raspbian / MacOS
# Notice: 
# How to run this script:
#    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/init.sh | sudo sh


# Load uitility functions in the same directory
INIT_DIR=$(dirname $0)
source $INIT_DIR/utils.sh

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


do_init_ubuntu(){
    echo "CURRENT Linux Distribution: [  Ubuntu  ]. Start initializing system funtionalities..."
    # Change server timezone
    echo "[   Change TIMEZONE   ]"
    sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    # Update server & install essentials
    echo "[   INITIAL UPDATE OF UBUNTU   ]"
    yes | sudo apt-get update
    # Install docker
    echo "[   DOWNLOADING SCRIPT FOR DOCKER   ]"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/docker/install-docker-ubuntu.sh | sudo sh
    # Setup Python3
    echo "[   DOWNLOADING SCRIPT FOR PYTHON3   ]"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/python/install_python3.sh | sudo sh
    # Setup Shadowsocks
    echo "[   DOWNLOADING SCRIPT FOR SHADOWSOCKS   ]"
    #curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/shadowsocks/ssserver-install-ubuntu.sh | sudo sh
    # Setup V2Ray
    echo "[   DOWNLOADING SCRIPT FOR V2RAY   ]"
    #curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/v2ray/install-v2ray-ubuntu.sh | sudo sh
    # Setup ZSH
    echo "[   DOWNLOADING SCRIPT FOR ZSH   ]"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/zsh/install-zsh-ubuntu.sh | sudo sh
    # Setup Vim
    echo "[   DOWNLOADING SCRIPT FOR VIM   ]"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/vim/install-vim-ubuntu.sh | sudo sh
    # Setup Tmux
    echo "[   DOWNLOADING SCRIPT FOR TMUX   ]"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/tmux/install-tmux-ubuntu.sh | sudo sh
    # Install Useful Programs
    echo "[   DOWNLOADING SCRIPT FOR Installing common programs   ]"
    sudo curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/etc/common-programs-ubuntu.sh | sudo sh
    # [THIS SECTION SHOULD BETTER BE PLACED AT THE BOTTOM]
    #echo "[   SET UP CRONTAB JOBS   ]"
    #sudo curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/etc/ubuntu/crontab.txt |crontab
    #echo "[   Rewrite SYSTEM START commands with Shadowsocks   ]"
    #sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/ubuntu/rc.local -O /etc/rc.local
}

do_init_rpi(){
    echo "CURRENT Linux Distribution: [  Raspbian  ]. Start initializing system funtionalities..."
    echo "[   Overwrite Raspberry Pi Default configs   ]-"
    sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/Rpi/boot/config.txt -O /boot/config.txt
    # Enable ssh
    sudo touch /boot/ssh
    # Setup WIFI (need you to rewrite wifi password in the file)
    #sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/wpa_supplicant.conf -O /boot/wpa_supplicant.conf
    # Update server & install essentials
    echo "[   INITIAL UPDATE OF UBUNTU   ]-"
    sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/Rpi/sources.list -O /etc/apt/sources.list
    yes | sudo apt-get update
    # Setup Python3
    echo "[   DOWNLOADING BASH SCRIPT FOR SETTING UP PYTHON3   ]-"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/python/isntall_python3.sh | sudo sh
    # Setup ZSH
    echo "[   DOWNLOADING BASH SCRIPT FOR SETTING UP ZSH   ]-"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/zsh/zsh-setup-rpi.sh | sudo sh
    # Setup Vim
    echo "[   DOWNLOADING BASH SCRIPT FOR SETTING UP VIM   ]-"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/vim/vim-setup-rpi.sh | sudo sh
    # Setup Tmux
    echo "[   DOWNLOADING BASH SCRIPT FOR SETTING UP TMUX   ]-"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/tmux/tmux-setup-rpi.sh | sudo sh
    # Install Useful Programs
    echo "[   DOWNLOADING BASH SCRIPT FOR Installing common programs   ]-"
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/etc/Rpi/common-programs-rpi.sh | sudo sh
}

do_init_mac(){
    echo "CURRENT OS: [  Mac OS X  ]. Start initializing system funtionalities..."
}

# Run initial functions by os version
do_init_by_os

