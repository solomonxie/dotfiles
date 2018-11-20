#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Debian based distro
# How to run:

set -x

REPO_ROOT="https://raw.githubusercontent.com/solomonxie/dotfiles/master"

do_install_apt_by_os(){
    # Load uitility functions (check os)
    curl -fsSL $REPO_ROOT/utils.sh -o $HOME/.bash-utils.sh
    source $HOME/.bash-utils.sh
    
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
