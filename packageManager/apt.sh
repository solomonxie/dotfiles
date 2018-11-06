#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Debian based distro
# How to run:

set -x

# Load uitility functions (check os)
if [ -r $HOME/.bash-utils.sh ]; then
    source $HOME/.bash-utils.sh
elif [ -r ../utils.sh ]; then
    source ../utils.sh
else
    curl -fsSL https://raw.githubusercontent.com/solomonxie/dotfiles/master/utils.sh -o $HOME/.bash-utils.sh
    source $HOME/.bash-utils.sh
fi

do_install_apt_by_os(){
    # Get Distro
    case $(get_distro) in
        "ubuntu")
            install_utils_ubuntu
            install_printer_ubuntu
            install_scanner_ubuntu
            apt_clear_cache
            ;;
        "raspbian")
            install_utils_rpi
            install_printer_ubuntu
            install_scanner_ubuntu
            ;;
    esac
}


install_utils_ubuntu(){
    sudo apt-get install mosh -y
    sudo apt-get install unzip -y
    sudo apt-get install ntfs-3g -y
    sudo apt-get install htop -y
    sudo apt-get install glances -y
    sudo apt-get install speedtest-cli -y
    sudo apt-get install ifstat -y
    sudo apt-get install fortune cowsay cmatrix -y
    sudo pip install youtube-dl tldr ffmpeg

    yes | sudo add-apt-repository ppa:dawidd0811/neofetch
    sudo apt update && sudo apt install neofetch -y
}

install_utils_rpi(){
    sudo apt-get install mosh -y
    sudo apt-get install ntfs-3g -y
    sudo apt-get install tightvncserver -y
    sudo apt-get install htop -y
    sudo apt-get install glances -y
    sudo apt-get install speedtest-cli -y
    sudo apt-get install ifstat -y
    sudo apt-get install fortune cowsay cmatrix -y
    sudo pip install youtube-dl tldr ffmpeg

    sudo echo "deb [arch=all] http://dl.bintray.com/dawidd6/neofetch jessie main" > /etc/apt/sources.list.d/neofetch.list
    sudo apt update && sudo apt install neofetch -y
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
    #sudo wget https://raw.githubusercontent.com/solomonxie/dotfiles/master/etc/ubuntu/sources-default.list -O /etc/apt/sources.list
    # China sources
    sudo wget https://raw.githubusercontent.com/solomonxie/dotfiles/master/etc/ubuntu/sources-cn.list -O /etc/apt/sources.list
    # US sources
    #sudo wget https://raw.githubusercontent.com/solomonxie/dotfiles/master/etc/ubuntu/sources-us.list -O /etc/apt/sources.list
}


apt_clear_cache(){
    yes | sudo apt-get autoremove
    yes | sudo apt-get autoclean
}

apt_remove_lock(){
    echo ""
}

do_install_apt_by_os
