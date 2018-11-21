#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Raspbian / Mac
# Notice: 

set -x

REPO_ROOT="https://raw.githubusercontent.com/solomonxie/dotfiles/master"

do_install_mysql_by_os(){
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
            install_mysql_ubuntu
            ;;
        "raspbian")
            echo ""
            ;;
    esac

}


install_mysql_ubuntu(){
    sudo apt-get update
    sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password your_password'
    sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password your_password'
    sudo apt-get -y install mysql-server
}


install_mysql_rpi(){
    echo ""
}

install_mysql_mac(){
    echo ""
}