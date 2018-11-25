#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu
# Notice: 

set -x

REPO_URL="https://raw.githubusercontent.com/solomonxie/dotfiles/master"


do_install_webdav(){
    # Load uitility functions (check os)
    curl -fsSL $REPO_URL/utils.sh -o ~/.bash-utils.sh
    source ~/.bash-utils.sh

    # Get Distro
    case distro in
        "ubuntu")
            install_webdav_ubuntu_apache
            ;;
        "raspbian")
            echo ""
            ;;
    esac
}

install_webdav_ubuntu_apache(){
    echo ""
}

install_webdav_ubuntu_nginx(){
    sudo apt-get update
    sudo apt-get install nginx nginx-extras -y
    sudo mkdir /var/webdav
    sudo chown www-data /var/webdav
}