#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Raspbian / Mac
# Notice: 

set -x

REPO_URL="https://raw.githubusercontent.com/solomonxie/dotfiles/master"

do_install_mysql_by_os(){
    if [ $# -eq 0 ]; then 
        echo "[ Failed ] Please specify OS version with --os flag."
        return 1; 
    fi
    # Get distro information
    distro=""
    while [ $# -gt 0 ] ;do
        case "$1" in
            "--os")
                distro=$2 
                shift 2;;
        esac
    done
    # Do different things with different OS
    case $distro in
        "ubuntu")
            install_mysql_ubuntu
            ;;
        "raspbian")
            install_mysql_rpi
            ;;
        "mac")
            install_mysql_mac
            ;;
    esac

}


install_mysql_ubuntu(){
    # Set root user's password without prompt
    sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root123'
    sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root123'
    # Install
    sudo apt-get -y install mysql-server
}


install_mysql_rpi(){
    # Set root user's password without prompt
    sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root123'
    sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root123'
    # Install
    sudo apt-get -y install mysql-server
}

install_mysql_mac(){
    brew install mysql
}
