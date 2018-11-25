# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#

DIR=$HOME

do_install_frps_ubuntu(){
    cd $DIR
    wget https://github.com/fatedier/frp/releases/download/v0.21.0/frp_0.21.0_linux_amd64.tar.gz
    tar -xzvf frp*.tar.gz && mv frp_*/ frp && cd frp
    curl -sSL $REPO_URL//frp/frps-ubuntu.ini -o frps.ini
}

run_frps_ubuntu(){
    cd $DIR/frp/
    ./frps -c ./frps.ini
}

run_frps_as_service_ubuntu(){
    sudo curl -sSL $REPO_URL//frp/frps.service -o /etc/systemd/system/frps.service
    sudo systemctl enable frps
    sudo systemctl status frps
}