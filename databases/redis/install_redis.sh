#! /usr/bin/env bash
#
# Enviroment: Ubuntu / Raspbian / Mac
# Notice: 

set -x

REPO_URL="https://raw.githubusercontent.com/solomonxie/dotfiles/master"

do_install_redis_by_os(){
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
    cd /tmp/
    wget http://download.redis.io/releases/redis-5.0.0.tar.gz
    tar -xvzf redis-5.0.0.tar.gz
    cd redis-5.0.0
    # Compile redis
    make
    make test
    sudo make install
    cd -
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
