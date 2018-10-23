#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Debian based distro
# How to run:
#   $ curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/package-manager/apt.sh | sudo sh

set -x

do_install_apt_by_os(){
    # Get Distro
    case $(get_distro) in
        "ubuntu")
            do_install_apt_tools_ubuntu ;;
        "raspbian")
            do_install_apt_tools_rpi ;;
    esac
}

get_distro(){
    local distro=""
    if [ -x "$(command -v lsb_release)" ]; then #Linux
        distro=$(lsb_release -si | tr '[:upper:]' '[:lower:]')
    elif [ -x "$(command -v uname)" ]; then #Others
        local info=$(uname -a | tr '[:upper:]' '[:lower:]')
        if [[ $info == *"Ubuntu"* ]]; then
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

do_install_apt_tools_ubuntu(){
    yes | sudo apt-get install mosh
    yes | sudo apt-get install unzip
    yes | sudo apt-get install ntfs-3g
    yes | sudo apt-get install htop
    yes | sudo apt-get install glances
    yes | sudo apt-get install speedtest-cli
    yes | sudo apt-get install ifstat
    yes | sudo apt-get install fortune cowsay cmatrix
    yes | pip install -U youtube-dl tldr ffmpeg

    sudo add-apt-repository ppa:dawidd0811/neofetch
    yes | sudo apt update && sudo apt install neofetch
}

do_install_apt_tools_rpi(){
    yes | sudo apt-get install mosh
    yes | sudo apt-get install ntfs-3g
    yes | sudo apt-get install htop
    yes | sudo apt-get install glances
    yes | sudo apt-get install speedtest-cli
    yes | sudo apt-get install ifstat
    yes | sudo apt-get install fortune cowsay cmatrix
    yes | pip install -U youtube-dl tldr ffmpeg

    sudo echo "deb [arch=all] http://dl.bintray.com/dawidd6/neofetch jessie main" > /etc/apt/sources.list.d/neofetch.list
    yes | sudo apt update && sudo apt install neofetch 
}

do_apt_add_sources(){
    # Default sources
    #sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/ubuntu/sources-default.list -O /etc/apt/sources.list
    # China sources
    sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/ubuntu/sources-cn.list -O /etc/apt/sources.list
    # US sources
    #sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/ubuntu/sources-us.list -O /etc/apt/sources.list
}


do_apt_clear_cache(){
    yes | sudo apt autoremove
}

do_apt_remove_lock(){
    echo ""
}

do_install_apt_by_os
do_apt_clear_cache