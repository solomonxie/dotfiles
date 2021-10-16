#! /usr/bin/env bash
#
# Enviroment: Debian based distro
# How to run:

set -x

REPO_URL=""

do_install_apt_by_os(){
    # Load uitility functions (check os)
    curl -fsSL $REPO_URL/utils.sh -o ~/.bash-utils.sh
    source ~/.bash-utils.sh
    
    # Get Distro
    case $(get_distro) in
        "ubuntu")
            install_pacman_ubuntu
            ;;
        "raspbian")
            install_pacman_rpi
            ;;
    esac
}

install_pacman_ubuntu(){
    echo ""
}

install_pacman_rpi(){
    echo ""
}
