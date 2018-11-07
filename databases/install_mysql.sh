#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu
# Notice: 

set -x

REPO_ROOT="https://raw.githubusercontent.com/solomonxie/dotfiles/master"


do_install_mysql(){
    # Load uitility functions (check os)
    curl -fsSL $REPO_ROOT/utils.sh -o $HOME/.bash-utils.sh
    source $HOME/.bash-utils.sh

    # Get Distro
    case distro in
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