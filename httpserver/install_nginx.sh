#! /usr/bin/env bash
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu
# Notice: 


set -x

REPO_URL="https://raw.githubusercontent.com/solomonxie/dotfiles/master"


do_install_nginx(){
    # Load uitility functions (check os)
    curl -fsSL $REPO_URL/utils.sh -o ~/.bash-utils.sh
    source ~/.bash-utils.sh

    # Get Distro
    case distro in
        "ubuntu")
            install_nginx_ubuntu
            ;;
        "raspbian")
            echo ""
            ;;
    esac
}

install_nginx_ubuntu(){
    sudo apt-get update
    sudo apt-get install nginx
}