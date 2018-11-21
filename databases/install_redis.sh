#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Raspbian / Mac
# Notice: 

set -x

REPO_ROOT="https://raw.githubusercontent.com/solomonxie/dotfiles/master"

do_install_redis_by_os(){
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
            install_redis_ubuntu
            ;;
        "raspbian")
            install_redis_rpi
            ;;
        "mac")
            install_redis_mac
            ;;
    esac

}

build_redis(){
    # Download redis
    wget http://download.redis.io/releases/redis-5.0.0.tar.gz
    tar -xvzf redis-*.tar.gz
    cd redis-*
    # Compile redis
    make
    make test
    sudo make install
}

install_redis_ubuntu(){
    sudo apt-get install redis-server
}


install_redis_rpi(){
    sudo apt-get install redis-server
}

install_redis_mac(){
    brew install redis
}