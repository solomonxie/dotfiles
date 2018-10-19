#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu / Raspbian / MacOS
# Notice: 
# How to run this script:
#    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/init.sh | sudo sh

# Load uitility functions in the same directory
source $(dirname $0)/utils.sh

do_init_by_os(){
    # Get Distro
    case $(get_distro) in
        "darwin" | "Mac OS X")
            echo "CURRENT OS: [  Mac OS X  ]. Start initializing system funtionalities..."
            do_init_mac ;;
        "ubuntu")
            echo "CURRENT Linux Distribution: [  Ubuntu  ]. Start initializing system funtionalities..."
            do_init_ubuntu ;;
        "raspbian")
            echo "CURRENT Linux Distribution: [  Raspbian  ]. Start initializing system funtionalities..."
            do_init_rpi ;;
    esac
}


do_init_ubuntu(){
    # Change server timezone
    echo "--------------------[   Change TIMEZONE   ]--------------------"
    sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime >> /var/log/init/log_system_update.txt 1>&2
    # Update server & install essentials
    echo "--------------------[   INITIAL UPDATE OF UBUNTU   ]--------------------"
    yes | sudo apt-get update >> /var/log/init/log_system_update.txt 1>&2
    # Install docker
    echo "--------------------[   DOWNLOADING SCRIPT FOR DOCKER   ]--------------------"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/docker/install-docker-ubuntu.sh | sudo sh >> /var/log/init/log_docker.txt 1>&2
    # Setup Python3
    echo "--------------------[   DOWNLOADING SCRIPT FOR PYTHON3   ]--------------------"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/python/install_python3.sh | sudo sh >> /var/log/init/log_python.txt 1>&2
    # Setup Shadowsocks
    echo "--------------------[   DOWNLOADING SCRIPT FOR SHADOWSOCKS   ]--------------------"
    #curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/shadowsocks/ssserver-install-ubuntu.sh | sudo sh >> /var/log/init/log_shadowsocks.txt 1>&2
    # Setup V2Ray
    echo "--------------------[   DOWNLOADING SCRIPT FOR V2RAY   ]--------------------"
    #curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/v2ray/install-v2ray-ubuntu.sh | sudo sh >> /var/log/init/log_shadowsocks.txt 1>&2
    # Setup ZSH
    echo "--------------------[   DOWNLOADING SCRIPT FOR ZSH   ]--------------------"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/zsh/install-zsh-ubuntu.sh | sudo sh >> /var/log/init/log_zsh.txt 1>&2
    # Setup Vim
    echo "--------------------[   DOWNLOADING SCRIPT FOR VIM   ]--------------------"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/vim/install-vim-ubuntu.sh | sudo sh >> /var/log/init/log_vim.txt 1>&2
    # Setup Tmux
    echo "--------------------[   DOWNLOADING SCRIPT FOR TMUX   ]--------------------"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/tmux/install-tmux-ubuntu.sh | sudo sh >> /var/log/init/log_tmux.txt 1>&2
    # Install Useful Programs
    echo "--------------------[   DOWNLOADING SCRIPT FOR Installing common programs   ]--------------------"
    sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/etc/common-programs-ubuntu.sh | sudo sh >> /var/log/init/log_common.txt 1>&2
    # [THIS SECTION SHOULD BETTER BE PLACED AT THE BOTTOM]
    #echo "--------------------[   SET UP CRONTAB JOBS   ]--------------------"
    #sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/etc/ubuntu/crontab.txt |crontab >> /var/log/init/log_crontab.txt 1>&2
    #echo "--------------------[   Rewrite SYSTEM START commands with Shadowsocks   ]--------------------"
    #sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/ubuntu/rc.local -O /etc/rc.local >> /var/log/init/log_rc_local.txt 1>&2
}

do_init_rpi(){
    echo "--------------------[   Overwrite Raspberry Pi Default configs   ]---------------------"
    sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/Rpi/boot/config.txt -O /boot/config.txt
    # Enable ssh
    sudo touch /boot/ssh
    # Setup WIFI (need you to rewrite wifi password in the file)
    #sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/wpa_supplicant.conf -O /boot/wpa_supplicant.conf

    # Update server & install essentials
    echo "--------------------[   INITIAL UPDATE OF UBUNTU   ]---------------------"
    sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/Rpi/sources.list -O /etc/apt/sources.list
    yes | sudo apt-get update

    # Setup Python3
    echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP PYTHON3   ]---------------------"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/python/isntall_python3.sh | sudo sh

    # Setup ZSH
    echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP ZSH   ]---------------------"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/zsh/zsh-setup-rpi.sh | sudo sh

    # Setup Vim
    echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP VIM   ]---------------------"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/vim/vim-setup-rpi.sh | sudo sh

    # Setup Tmux
    echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP TMUX   ]---------------------"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/tmux/tmux-setup-rpi.sh | sudo sh

    # Install Useful Programs
    echo "--------------------[   DOWNLOADING BASH SCRIPT FOR Installing common programs   ]---------------------"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/etc/Rpi/common-programs-rpi.sh | sudo sh
}

do_init_mac(){
    echo ""
}

# Run initial functions by os version
do_init_by_os

