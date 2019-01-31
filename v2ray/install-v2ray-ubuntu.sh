#! /usr/bin/env bash
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# Notice: 


do_install_v2ray_quick(){
    echo "----[   Installing V2Ray with Quick Script   ]----"
    sudo su
    bash <(curl -L -s https://install.direct/go.sh)
}

do_install_v2ray_docker(){
    docker run -dt --name v2ray -p 23409:23409 mritd/v2ray
}

do_setup_v2ray(){
    echo "----[  Overwrite V2Ray Config file  ]----"
    wget https://github.com/solomonxie/dotfiles/raw/master/v2ray/config-server-vmess.json -O /etc/v2ray/config.json

    echo "----[   Starting V2Ray   ]----"
    sudo systemctl start v2ray
    # sudo /usr/bin/v2ray/v2ray -config /etc/v2ray/config.json
}

do_remove_v2ray(){
    sudo systemctl stop v2ray
    sudo systemctl disable v2ray
    sudo service v2ray stop
    sudo update-rc.d -f v2ray remove
    sudo rm -rvf /etc/v2ray
    sudo rm -rvf /usr/bin/v2ray/
    sudo rm -rvf /var/log/v2ray/
    sudo rm -vf /lib/systemd/system/v2ray.service
    sudo rm -vf /etc/init.d/v2ray
}

do_install_v2ray_quick
do_setup_v2ray
