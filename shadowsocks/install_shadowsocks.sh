#! /usr/bin/env bash
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Raspbian / MacOS Sierra
#
# Commands:


set -x

# Setup env variables and shared functions
cd $(dirname $0); source "$(dirname $(pwd))/dotfiles.env"; cd -

#-------------------------------------
#     Installation Methods
#-------------------------------------

do_install_shadowsocks(){
    # Do different things with different OS
    case $MYOS in
        ubuntu)
            sudo apt install shadowsocks-libev -y ;;
        raspbian)
            sudo apt install shadowsocks-libev -y
            set_sslocal_service_pi ;;
    esac
}


set_sslocal_service_pi(){
    echo ""
    sudo cp $SRC/shadowsocks/sslocal.json /etc/shadowsocks-libev/ss-local.json
    sudo cp $SRC/shadowsocks/ss-local.service /etc/systemd/system/ss-local.service
    sudo ln -sf /usr/bin/ss-local /usr/sbin/ss-local
    sudo systemctl enable ss-local.service
    sudo systemctl start ss-local.service
    sudo systemctl status ss-local.service
}


build_ss_libev_pi(){
    # Dependencies
    yes | sudo apt-get install --no-install-recommends gettext build-essential autoconf libtool libpcre3-dev asciidoc xmlto libev-dev libc-ares-dev automake libmbedtls-dev libsodium-devA && \
    echo "[OK]"
    mkdir -p ~/local/build_source/
    cd ~/local/build_source/
    # Installation of libsodium
    export LIBSODIUM_VER=1.0.16
    wget https://download.libsodium.org/libsodium/releases/libsodium-$LIBSODIUM_VER.tar.gz && \
    tar xvf libsodium-$LIBSODIUM_VER.tar.gz && \
    pushd libsodium-$LIBSODIUM_VER && \
    ./configure --prefix=/opt && \
    make && sudo make install && \
    popd && sudo ldconfig && echo "[OK]"
    # Installation of MbedTLS
    export MBEDTLS_VER=2.6.0 && \
    wget https://tls.mbed.org/download/mbedtls-$MBEDTLS_VER-gpl.tgz && \
    tar xvf mbedtls-$MBEDTLS_VER-gpl.tgz && \
    pushd mbedtls-$MBEDTLS_VER && \
    make SHARED=1 CFLAGS=-fPIC && \
    sudo make DESTDIR=/opt install && \
    popd && sudo ldconfi && echo "[OK]"

    git clone https://github.com/madeye/shadowsocks-libev.git
    cd shadowsocks-libev
    git submodule update --init --recursive
    # Start building
    ./autogen.sh && \
    ./configure --prefix=/opt/shadowsocks-libev  && \
    make && sudo make install && \
    echo "[ OK ]"
}








#-------------------------------------
#          Entry points
#-------------------------------------

do_install_shadowsocks "$@"