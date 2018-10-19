#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Debian based distro

do_install_apt_tools_ubuntu(){
    yes | sudo apt-get install mosh
    yes | sudo apt-get install unzip
    yes | sudo apt-get install ntfs-3g
    yes | sudo apt-get install htop
    yes | sudo apt-get install glances
    yes | sudo apt-get install speedtest-cli
    yes | sudo apt-get install ifstat
    yes | sudo apt-get install fortune cowsay cmatrix
    yes | pip install -U youtube-dl you-get tldr ffmpeg

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
    yes | pip install -U youtube-dl you-get tldr ffmpeg

    sudo echo "deb [arch=all] http://dl.bintray.com/dawidd6/neofetch jessie main" > /etc/apt/sources.list.d/neofetch.list
    yes | sudo apt update && sudo apt install neofetch 
}


do_apt_clear_cache(){
    echo ""
}

do_apt_remove_lock(){
    echo ""
}
