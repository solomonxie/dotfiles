# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# ENVIRONMENT: Ubuntu / Raspbian


set -ax

MYHOME=`getent passwd ${SUDO_UID:-$(id -u)} | cut -d: -f 6`
REPO_URL="https://raw.githubusercontent.com/solomonxie/dotfiles/master"
SRC="$MYHOME/dotfiles"
OS=""


do_install_shadowsocks(){
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
            install_ss_ubuntu
            ;;
        "raspbian")
            install_ss_pi
            ;;
        "mac")
            echo "" ;;
    esac
}

install_ss_ubuntu(){}
install_ss_libev_ubuntu(){}

install_ss_pi(){}


install_ss_libev_pi(){
    yes | sudo apt install shadowsocks-libev
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