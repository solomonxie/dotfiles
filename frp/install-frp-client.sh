# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#

DIR=$HOME

do_install_frpc_rpi(){
    VER="0.21.0_linux_arm"
    cd $DIR
    wget https://github.com/fatedier/frp/releases/download/v0.21.0/frp_$VER.tar.gz
    tar -xzvf frp_$VER.tar.gz
    cd frp_$VER
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/frp/frpc-rpi.ini -o frpc.ini
}

run_frpc_rpi(){
    cd $DIR
    ./frpc -c ./frpc.ini
}

run_frpc_as_service_rpi(){
    sudo curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/frp/frpc.service -o /etc/systemd/system/frpc.service \
    && sudo systemctl enable frpc
    && sudo systemctl status frpc
}