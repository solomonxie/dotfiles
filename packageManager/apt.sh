#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Debian based distro
# How to run:

set -x

source ../utils.sh

do_install_apt_by_os(){
    # Get Distro
    case $(get_distro) in
        "ubuntu")
            install_utils_ubuntu
            install_printer_ubuntu
            install_scanner_ubuntu
            ;;
        "raspbian")
            install_utils_rpi
            install_printer_ubuntu
            install_scanner_ubuntu
            ;;
    esac
}


install_utils_ubuntu(){
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

install_utils_rpi(){
    yes | sudo apt-get install mosh
    yes | sudo apt-get install ntfs-3g
    yes | sudo apt-get install tightvncserver
    yes | sudo apt-get install htop
    yes | sudo apt-get install glances
    yes | sudo apt-get install speedtest-cli
    yes | sudo apt-get install ifstat
    yes | sudo apt-get install fortune cowsay cmatrix
    yes | pip install -U youtube-dl tldr ffmpeg

    sudo echo "deb [arch=all] http://dl.bintray.com/dawidd6/neofetch jessie main" > /etc/apt/sources.list.d/neofetch.list
    yes | sudo apt update && sudo apt install neofetch 
}

install_printer_ubuntu(){
    sudo apt-get install cups -y
    sudo usermod -aG lpadmin $USER
    sudo cupsctl --remote-any
    # Process to this url to manage printers:
    # https://ServerIP:631/
}

install_printer_rpi(){
    sudo apt-get install cups -y
    sudo usermod -aG lpadmin $USER
    sudo cupsctl --remote-any
    # Process to this url to manage printers:
    # https://ServerIP:631/
}

install_scanner_ubuntu(){
    sudo apt install sane -y
    # List all Scan devices with Names
    scanimage -L
    # Scan an image
    scanimage -d "DeviceName" –-format=tiff > sample.tiff
}

install_scanner_rpi(){
    sudo apt install sane -y
    # List all Scan devices with Names
    scanimage -L
    # Scan an image
    scanimage -d "DeviceName" –-format=tiff > sample.tiff
}

apt_add_sources(){
    # Default sources
    #sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/ubuntu/sources-default.list -O /etc/apt/sources.list
    # China sources
    sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/ubuntu/sources-cn.list -O /etc/apt/sources.list
    # US sources
    #sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/ubuntu/sources-us.list -O /etc/apt/sources.list
}


apt_clear_cache(){
    yes | sudo apt-get autoremove
    yes | sudo apt-get autoclean
}

apt_remove_lock(){
    echo ""
}

do_install_apt_by_os
apt_clear_cache