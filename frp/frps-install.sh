# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#

do_install_frp_server_ubuntu(){
    cd $HOME
    wget https://github.com/fatedier/frp/releases/download/v0.21.0/frp_0.21.0_linux_amd64.tar.gz
    tar -xzvf frp*.tar.gz && mv frp_*/ frp && cd frp
    curl -sSL https://raw.githubusercontent.com/solomonxie/cdn/master/frp/frps-ubuntu.ini -o frps.ini
}

run_frp_server_ubuntu(){
    cd $HOME/frp/
    ./frps -c ./frps.ini
}

run_frp_server_as_service_ubuntu(){
    echo ""
}