#! /bin/bash
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Rpi
#
# Run:
#   $ ./docker-apps.sh --os ubuntu
# Debug:
#   $ bashdb ./apt.sh --os ubuntu


set -x

# Setup env variables and shared functions
cd $(dirname $0); source "$(dirname $(pwd))/myconf/dotfiles.env"; cd -

#-------------------------------------
#     Installation Methods
#-------------------------------------

do_install_docker_apps(){
    # Do different things with different OS
    case $MYOS in
        ubuntu)
            docker_shadowsocks
            docker_shadowsocks_old
            docker_v2ray
            docker_webav
            docker_frp
            docker_vpn_ipsec
            docker_playground_ubuntu
            # docker_wsgidav
            ;;
        raspbian)
            docker_webdav_rpi
            docker_vpn_ipsec_rpi
            ;;
        mac)
            echo "Mac"
            ;;
    esac
}

docker_playground_ubuntu(){
    docker run -it --name ubuntu solomonxie/lightsail:ubuntu-1604 bash
}

docker_playground_rpi(){
    docker run -it --name ubuntu solomonxie/rpi-init:jessie bash
}

docker_webav(){
    # The folder on host MUST have the same permission
    # otherwise it'll cause permission error
    # Permission problem:
    # has to get inside container by `docker exec -it webdav sh`
    # and do `chown -R www-data:www-data /var/www/webdav`
    #
    # Image: $ docker pull solomonxie/webdav:latest
    sudo mkdir $HOME/webdav
    sudo chown -R $USER:www-data $HOME/webdav
    #sudo chmod -R g+s $HOME/webdav
    docker run -d --name webdav --restart=always \
        -v $HOME/webdav:/var/www/webdav \
        -e USERNAME=$USER -e PASSWORD=123 \
        -p 8888:80 solomonxie/webdav:latest
}

docker_webdav_rpi(){
    #: <Permission problem>
    # has to get inside container by `docker exec -it webdav sh`
    # and do `chown -R www-data:www-data /var/www/webdav`
    sudo mkdir /var/webdav
    ln -sf /var/webdav $HOME/webdav
    sudo chown -R $USER:www-data /var/webdav
    #sudo chmod -R g+s $HOME/webdav
    #
    # <Image>: $ docker pull solomonxie/webdav-rpi:latest
    docker run -dt --name webdav --restart=always \
        -v $HOME/docker-rpi/:/config \
        -v $HOME/webdav:/var/www/webdav \
        -e USERNAME=$USER -e PASSWORD=123 \
        -p 8888:80 solomonxie/webdav-rpi:jessie
}

docker_wsgidav(){
    #docker run -dt \
    #    --restart always -p 8880:8080 \
    #    -v $HOME/webdav:/var/wsgidav-root mar10/wsgidav
    #
    #Image: $ docker pull solomonxie/wsgidav:latest
    docker run -dt --name wsgidav --restart always \
        -v $HOME/.config/wsgidav:/var/wsgidav/configs \
        -v $HOME/webdav:/var/wsgidav/webdav -v $HOME/share:/var/wsgidav/share \
        -p 8880:80 solomonxie/wsgidav:latest
}

docker_wsgidav_rpi(){
    #Image: $ docker pull solomonxie/wsgidav-rpi:latest
    docker run -dt --name wsgidav --restart always \
        -v $HOME/.config/wsgidav:/var/wsgidav/config \
        -v $HOME/webdav:/var/wsgidav/webdav -v $HOME/share:/var/wsgidav/share \
        -p 8880:80 solomonxie/wsgidav-rpi:latest
    # Debugging:
    # docker run -it --rm -p 8880:80 -v $HOME/.config/wsgidav:/var/wsgidav/configs -v $HOME/webdav:/var/wsgidav/webdav -v $HOME/share:/var/wsgidav/share solomonxie/wsgidav-rpi
}


docker_shadowsocks(){
    # Image: $ docker pull mritd/shadowsocks
    PORT=6000
    METHOD=aes-256-gcm
    #METHOD=chacha20
    PASSWORD=shadow123
    docker run -dt --name ssserver --restart always \
        -p $PORT:$PORT -p $PORT:$PORT/udp mritd/shadowsocks -m "ss-server" \
        -s "-s 0.0.0.0 -p $PORT -m $METHOD -k $PASSWORD --fast-open" \
        -x -e "kcpserver" \
        -k "-t 127.0.0.1:$PORT -l :$PORT_UPD -mode fast2 -key kcp123 -crypt aes-128"
}

docker_shadowsocks_old(){
    # Image: $ docker pull mritd/shadowsocks
    PORT=1988
    METHOD=aes-256-cfb
    #METHOD=chacha20
    PASSWORD=shadow123
    docker run -dt --name ssserver-old --restart always \
        -p $PORT:$PORT -p $PORT:$PORT/udp mritd/shadowsocks -m "ss-server" \
        -s "-s 0.0.0.0 -p $PORT -m $METHOD -k $PASSWORD --fast-open" \
        -x -e "kcpserver" -k "-t 127.0.0.1:$PORT -l :$PORT_UPD -mode fast2 -key kcp123 -crypt aes-128"
}


docker_shadowsocks_libev_local(){
    PORT=6000
    PASSWORD=shadow123
    docker run -dt -e PASSWORD=$PASSWORD \
        -p $PORT:$PORT -p $PORT:$PORT/udp \
        shadowsocks/shadowsocks-libev
}



docker_v2ray(){
    # Image: $ docker pull solomonxie/v2ray:latest
    docker run -dt --restart always \
        --name v2ray -p 12345:23456 solomonxie/v2ray:latest \
        /usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
}

docker_vpn_ipsec(){
    # Image: $ docker pull hwdsl2/ipsec-vpn-server:latest
    touch $HOME/.vpn.env
    echo "VPN_USER=ubuntu" >> $HOME/.vpn.env
    echo "VPN_PASSWORD=ipsec123" >> $HOME/.vpn.env
    echo "VPN_IPSEC_PSK=pre-password123" >> $HOME/.vpn.env
    docker run \
        --name vpn --restart always \
        -p 500:500/udp -p 4500:4500/udp \
        -v /lib/modules:/lib/modules:ro \
        --env-file $HOME/.vpn.env -d --privileged \
        hwdsl2/ipsec-vpn-server
}

docker_vpn_ipsec_rpi(){
    # Image: $ docker pull solomonxie/vpn-ipsec-rpi:latest
    touch $HOME/.vpn.env
    echo "VPN_USER=pi" >> $HOME/.vpn.env
    echo "VPN_PASSWORD=ipsec123" >> $HOME/.vpn.env
    echo "VPN_IPSEC_PSK=pre-password123" >> $HOME/.vpn.env
    docker run \
        --name vpn --restart always \
        -p 500:500/udp -p 4500:4500/udp \
        -v /lib/modules:/lib/modules:ro \
        --env-file $HOME/.vpn.env -d --privileged \
        solomonxie/vpn-ipsec-rpi
}

docker_smb(){
    echo ""
}


docker_jekyll(){
    echo ""
}


docker_frp(){
    #frp-server
    #Image: $ docker pull solomonxie/frp:latest
    docker run -dt --name frps \
        -p 7000:7000 -p 7500:7500 -p 7800:7800 \
        -v $SRC/frp:/conf solomonxie/frp:latest \
        /frp/frps -c /conf/frps.ini

    # How docker FRP works:
    # Client(8888) -> FRP-Docker(7888) -> Server(7888) -> Browser(7888)
    # Client(22) -> FRP-Docker(2200) -> Server(7022) -> Browser(7022)
    # Client(5901) -> FRP-Docker(7901) -> Server(7901) -> Browser(7901)
    #
    #-> 7000 as entry point
    #-> 7500 as Admin web page
    #-> 7800 as webdav mapper
    #-> 7901 as VNC desktop port
    #-> 7022 as SSH port
    #-> 4500 as VPN port

    #--------------------------------------
    # Can't run a frp-client in docker ALONE
    # because it's not making any sense
    # it's only okay to run as docker service
    # to connect another container
    #--------------------------------------
}


docker_gitbook(){
    echo ""
}


docker_owncloud(){
    echo ""
}


docker_nextcloud_sqlite(){
    # Get current UID by `$ id -u $USER`
    # Get current GID by `$ id -g $USER`
    #
    # IMAGE: $ docker pull linuxserver/nextcloud:latest
    docker run -dt \
        --name nextcloud --restart always \
        -p 8080:80 -p 8443:443\
        -e PUID=1000 -e PGID=1000 \
        -v $HOME/nextcloud/config:/config \
        -v $HOME/nextcloud/data:/data \
        linuxserver/nextcloud
}

docker_nextcloud_rpi(){
    echo ""
}


docker_emby_ubuntu(){
    # IMAGE: $ docker pull emby/embyserver:latest
    docker run -d --restart=always \
        -v $HOME/emby/config:/config \
        -v $HOME/emby/share1:/mnt/share1 \
        -v $HOME/emby/share2:/mnt/share2 \
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
    #
    # IMAGE: $ docker pull fauria/vsftpd:latest
    docker run -d -v $HOME/ftpshare:/home/vsftpd \
        -p 20:20 -p 21:21 -p 21100-21110:21100-21110 \
        -e FTP_USER=ubuntu -e FTP_PASS=123 \
        -e PASV_ADDRESS=0.0.0.0 -e PASV_MIN_PORT=21100 -e PASV_MAX_PORT=21110 \
        --name vsftpd --restart=always fauria/vsftpd

}




#-------------------------------------
#          Entry points
#-------------------------------------

do_install_docker_apps "$@"
