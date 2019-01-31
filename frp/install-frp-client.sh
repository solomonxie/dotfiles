#! /usr/bin/env bash
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Rpi
#
# Run:
#   $ 
# Debug:
#   $

set -x

# Setup env variables and shared functions
cd $(dirname $0); source "$(dirname $(pwd))/dotfiles.env"; cd -

#-------------------------------------
#     Installation Methods
#-------------------------------------

do_install_frp_client(){
    VER="0.21.0_linux_arm"
    DIR=$MYHOME/$VER
    # Do different things with different OS
    case $MYOS in
        ubuntu | raspbian)
            do_install_frpc_dev
            run_frpc_deb
            run_frpc_as_service_deb
            ;;
        mac)
            echo "Mac"
            ;;
    esac
}


do_install_frpc_deb(){
    cd ~
    wget https://github.com/fatedier/frp/releases/download/v0.21.0/frp_$VER.tar.gz
    tar -xzvf frp_$VER.tar.gz
    cd frp_$VER
    cp $SRC/frp/frpc-rpi.ini ./frpc.ini
}

run_frpc_deb(){
    cd $DIR
    ./frpc -c ./frpc.ini
}

run_frpc_as_service_deb(){
    cp $SRC/frp/frpc.service /etc/systemd/system/frpc.service && \
    sudo systemctl enable frpc && \
    sudo systemctl status frpc
}


#-------------------------------------
#          Entry points
#-------------------------------------

do_install_frp_client "$@"
