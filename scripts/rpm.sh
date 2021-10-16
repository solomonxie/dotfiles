#! /usr/bin/env bash
#
# Enviroment: Debian based distro
# How to run:

set -x

REPO_URL="https://raw.githubusercontent.com/solomonxie/dotfiles/master"

do_install_apt_by_os(){
    # Load uitility functions (check os)
    curl -fsSL $REPO_URL/utils.sh -o ~/.bash-utils.sh
    source ~/.bash-utils.sh
    
    # Get Distro
    case $(get_distro) in
        "ubuntu")
            install_rpm_ubuntu
            ;;
        "raspbian")
            install_rpm_rpi
            ;;
    esac
}

install_rpm_ubuntu(){
    echo ""
}

install_rpm_rpi(){
    echo ""
}
