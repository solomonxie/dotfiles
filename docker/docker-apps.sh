#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu
# Notice: 

set -x

# Load uitility functions (check os)
if [ -r $HOME/.bash-utils.sh ]; then
    source $HOME/.bash-utils.sh
elif [ -r ../utils.sh ]; then
    source ../utils.sh
else
    curl -fsSL https://raw.githubusercontent.com/solomonxie/dotfiles/master/utils.sh -o $HOME/.bash-utils.sh
    source $HOME/.bash-utils.sh
fi

do_install_docker_apps(){
    case distro in
        "ubuntu")
            docker_webav
            docker_wsgidav
            docker_shadowsocks
            docker_shadowsocks_old
            docker_v2ray
            docker_vpn_ipsec
            docker_frp
            docker_frp
            ;;
        "raspbian")
            docker_webdav_rpi
            docker_vpn_ipsec_rpi
            ;;
        "mac")
            echo "" ;;
    esac
}


docker_webav(){
    # The folder on host MUST have the same permission
    # otherwise it'll cause permission error
    # Permission problem: 
    # has to get inside container by `docker exec -it webdav sh`
    # and do `chown -R www-data:www-data /var/www/webdav`
    mkdir ~/webdav
    sudo chown -R www-data:www-data ~/webdav
    docker run -d --name webdav --restart=always \
        -v ~/webdav:/var/www/webdav \
        -e USERNAME=ubuntu -e PASSWORD=123 \
        -p 8888:80 solomonxie/webdav:ubuntu
}

docker_webdav_rpi(){
    # Permission problem: 
    # has to get inside container by `docker exec -it webdav sh`
    # and do `chown -R www-data:www-data /var/www/webdav`
    docker run -d --name webdav --restart always \
        -v ~/webdav:/var/www/webdav \
        -e USERNAME=pi -e PASSWORD=123 \
        -p 8888:80 solomonxie/webdav-rpi:jessie
}

docker_wsgidav(){
    #docker run -dt \
    #    --restart always -p 8880:8080 \
    #    -v ~/webdav:/var/wsgidav-root mar10/wsgidav
    docker run -dt --name wsgidav \
        -v ~/docker/wsgidav/configs:/var/wsgidav/configs \
        -v ~/webdav:/var/wsgidav/webdav -v ~/share:/var/wsgidav/share \
        -p 8880:80 solomonxie/wsgidav 
        wsgidav -c /var/wsgidav/configs/wsgidav.yaml
}


docker_shadowsocks(){
    # mritd/shadowsocks
    PORT=6000
    PORT_UPD=6050
    METHOD=aes-256-gcm
    #METHOD=chacha20
    PASSWORD=shadow123
    docker run -dt --name ssserver --restart always \
        -p $PORT:$PORT -p $PORT_UPD:$PORT_UPD/udp mritd/shadowsocks -m "ss-server" \
        -s "-s 0.0.0.0 -p $PORT -m $METHOD -k $PASSWORD --fast-open" \
        -x -e "kcpserver" -k "-t 127.0.0.1:$PORT -l :$PORT_UPD -mode fast2 -key kcp123 -crypt aes-128"
}

docker_shadowsocks_old(){
    # mritd/shadowsocks
    PORT=1988
    PORT_UPD=1989
    METHOD=aes-256-cfb
    #METHOD=chacha20
    PASSWORD=shadow123
    docker run -dt --name ssserver-old --restart always \
        -p $PORT:$PORT -p $PORT_UPD:$PORT_UPD/udp mritd/shadowsocks -m "ss-server" \
        -s "-s 0.0.0.0 -p $PORT -m $METHOD -k $PASSWORD --fast-open" \
        -x -e "kcpserver" -k "-t 127.0.0.1:$PORT -l :$PORT_UPD -mode fast2 -key kcp123 -crypt aes-128"
}



docker_v2ray(){
    docker run -dt --restart always \
        --name v2ray -p 12345:23456 solomonxie/v2ray:latest \
        /usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
}

docker_vpn_ipsec(){
    touch ~/.vpn.env
    echo "VPN_USER=ubuntu" >> ~/.vpn.env
    echo "VPN_PASSWORD=ipsec123" >> ~/.vpn.env
    echo "VPN_IPSEC_PSK=pre-password123" >> ~/.vpn.env
    docker run \
        --name vpn --restart always \
        -p 500:500/udp -p 4500:4500/udp \
        -v /lib/modules:/lib/modules:ro \
        --env-file ~/.vpn.env -d --privileged \
        hwdsl2/ipsec-vpn-server
}

docker_vpn_ipsec_rpi(){
    touch ~/.vpn.env
    echo "VPN_USER=pi" >> ~/.vpn.env
    echo "VPN_PASSWORD=ipsec123" >> ~/.vpn.env
    echo "VPN_IPSEC_PSK=pre-password123" >> ~/.vpn.env
    docker run \
        --name vpn --restart always \
        -p 500:500/udp -p 4500:4500/udp \
        -v /lib/modules:/lib/modules:ro \
        --env-file ~/.vpn.env -d --privileged \
        solomonxie/vpn-ipsec-rpi
}

docker_smb(){}


docker_jekyll(){}


docker_frp(){
    # frp-server
    docker run -dt --name frps \
        -p 7000:7000 -p 8000:7800 \
        -v ~/frp:/conf solomonxie/frp:0.20.0 \
        /frp/frps -c /conf/frps.ini

    # Can't run a frp-client in docker ALONE
    # because it's not making any sense
    # it's only okay to run as docker service
    # to connect another container
}


docker_gitbook(){}


docker_owncloud(){}


docker_nextcloud_sqlite(){
    # Get current UID by `$ id -u $USER`
    # Get current GID by `$ id -g $USER`
    docker run -dt \
        --name nextcloud --restart always \
        -p 8080:80 -p 8443:443\
        -e PUID=1000 -e PGID=1000 \
        -v ~/nextcloud/config:/config \
        -v ~/nextcloud/data:/data \
        linuxserver/nextcloud
}

docker_nextcloud_rpi(){
    echo ""
}


docker_emby_ubuntu(){
    docker run -d --restart=always \
        -v ~/emby/config:/config \
        -v ~/emby/share1:/mnt/share1 \
        -v ~/emby/share2:/mnt/share2 \
        -p 8096:8096 -p 8920:8920 \
        --env UID=1000 --env GID=100 --env GIDLIST=100 \
        emby/embyserver:latest
}


docker_ftp(){
    # Permission problem: 
    # Volume's owner in container is ftp:ftp
    # shouldn't change ownership from HOST
    # has to get inside container by `docker exec -it webdav sh`
    # and do `chown -R /var/webdav`
    #
    # Remember to connect with port 21
    docker run -d -v ~/ftpshare:/home/vsftpd \
        -p 20:20 -p 21:21 -p 21100-21110:21100-21110 \
        -e FTP_USER=ubuntu -e FTP_PASS=123 \
        -e PASV_ADDRESS=0.0.0.0 -e PASV_MIN_PORT=21100 -e PASV_MAX_PORT=21110 \
        --name vsftpd --restart=always fauria/vsftpd

}