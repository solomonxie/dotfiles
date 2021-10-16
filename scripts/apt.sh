#! /usr/bin/env bash
#
# Enviroment: Debian based distro
#
# Run:
#   $ ./apt.sh --os ubuntu
# Debug:
#   $ bashdb ./apt.sh --os ubuntu

set -x

# Setup env variables and shared functions
cd $(dirname $0); source "$(dirname $(pwd))/dotfiles.env"; cd -

#-------------------------------------
#     Installation Methods
#-------------------------------------

do_install_apt_by_os(){
    # Update
    sudo apt-get update
    # Do different things with different OS
    case $MYOS in
        ubuntu)
            install_utils_ubuntu
            install_printer_ubuntu
            install_scanner_ubuntu
            ;;
        raspbian)
            install_utils_rpi
            install_printer_ubuntu
            install_scanner_ubuntu
            ;;
    esac
    apt_clear_cache
}


install_utils_ubuntu(){
    sudo apt-get install apt-utils -y
    sudo apt-get install checkinstall -y
    sudo apt-get install mosh tree unzip htop ifstat bashdb -y
    sudo apt-get install ranger nnn w3m tig axel -y
    sudo apt-get install rg fd -y
    sudo apt-get install ntfs-3g -y
    sudo apt-get install speedtest-cli -y
    sudo apt-get install unar -y
    #sudo apt-get install fortune cowsay cmatrix -y
    pip install --user youtube-dl tldr ffmpeg

    #yes | sudo add-apt-repository ppa:dawidd0811/neofetch
    #sudo apt update && sudo apt install neofetch -y
}

install_utils_rpi(){
    sudo apt-get install vim -y
    sudo apt-get install apt-utils -y
    sudo apt-get install checkinstall -y
    sudo apt-get install mosh tree unzip htop ifstat bashdb -y
    sudo apt-get install ranger w3m tig axel -y
    sudo apt-get install rg fd -y
    sudo apt-get install ntfs-3g -y
    sudo apt-get install tightvncserver -y
    sudo apt-get install speedtest-cli -y
    sudo apt-get install lsof -y
    sudo apt-get install unar -y
    #sudo apt-get install fortune cowsay cmatrix -y
    pip install --user youtube-dl tldr ffmpeg

    #sudo echo "deb [arch=all] http://dl.bintray.com/dawidd6/neofetch jessie main" > /etc/apt/sources.list.d/neofetch.list
    #sudo apt update && sudo apt install neofetch -y

    # Remove unnecessary softwares
    sudo apt-get remove --purge wolfram-engine -y
    sudo apt-get remove --purge libreoffice* -y
    sudo apt-get remove --purge texlive* -y
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
    # scanimage -d "DeviceName" –-format=tiff > sample.tiff
}

install_scanner_rpi(){
    sudo apt install sane -y
    # List all Scan devices with Names
    scanimage -L
    # Scan an image
    # scanimage -d "DeviceName" –-format=tiff > sample.tiff
}

apt_add_sources(){
    # Default sources
    #sudo wget $REPO_URL//etc/ubuntu/sources-default.list -O /etc/apt/sources.list
    # China sources
    sudo wget $REPO_URL/etc/ubuntu/sources-cn.list -O /etc/apt/sources.list
    # US sources
    #sudo wget $REPO_URL//etc/ubuntu/sources-us.list -O /etc/apt/sources.list
}


apt_clear_cache(){
    sudo apt-get autoremove -y
    sudo apt-get autoclean -y
}

apt_remove_lock(){
    echo ""
}



#-------------------------------------
#          Entry points
#-------------------------------------

do_install_apt_by_os "$@"
