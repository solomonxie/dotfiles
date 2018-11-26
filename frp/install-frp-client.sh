# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#

ME=$(who am i | awk '{print $1}')
MYHOME=`getent passwd $ME | cut -d: -f 6`
REPO_URL="https://raw.githubusercontent.com/solomonxie/dotfiles/master"

VER="0.21.0_linux_arm"
DIR=$MYHOME/$VER

do_install_frpc_rpi(){
    cd ~
    wget https://github.com/fatedier/frp/releases/download/v0.21.0/frp_$VER.tar.gz
    tar -xzvf frp_$VER.tar.gz
    cd frp_$VER
    wget $REPO_URL/frp/frpc-rpi.ini -O frpc.ini
}

run_frpc_rpi(){
    cd $DIR
    ./frpc -c ./frpc.ini
}

run_frpc_as_service_rpi(){
    sudo wget $REPO_URL/frp/frpc.service -O /etc/systemd/system/frpc.service \
    && sudo systemctl enable frpc
    && sudo systemctl status frpc
}