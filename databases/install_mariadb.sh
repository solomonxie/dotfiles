#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Raspbian / Mac
# Notice: 

set -x

REPO_ROOT="https://raw.githubusercontent.com/solomonxie/dotfiles/master"

do_install_mariadb_by_os(){
    # Get distro information
    distro=""
    while [ $# -gt 0 ] ;do
        case "$1" in
            "--distro")
                distro=$2 
                shift 2;;
        esac
    done
    # Do different things with different OS
    case $distro in
        "ubuntu")
            install_mariadb_ubuntu
            ;;
        "raspbian")
            install_mariadb_rpi
            ;;
        "mac")
            install_mariadb_mac
            ;;
    esac

}


install_mariadb_ubuntu(){
    # Set root user's password without prompt
    sudo debconf-set-selections <<< 'mariadb-server mysql-server/root_password password root123'
    sudo debconf-set-selections <<< 'mariadb-server mysql-server/root_password_again password root123'
    # Install
    sudo apt-get -y install mariadb-server
}


install_mariadb_rpi(){
    # Set root user's password without prompt
    sudo debconf-set-selections <<< 'mariadb-server mysql-server/root_password password root123'
    sudo debconf-set-selections <<< 'mariadb-server mysql-server/root_password_again password root123'
    # Install
    sudo apt-get -y install mariadb-server
}

install_mariadb_mac(){
    brew install mariadb
}
