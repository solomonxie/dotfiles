#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# Notice: 


do_install_v2ray_quick(){
    sudo bash <(curl -L -s https://install.direct/go.sh)
}

do_install_v2ray_docker(){
    docker run -dt --name v2ray -p 10086:10086 mritd/v2ray
}

do_install_v2ray_quick
