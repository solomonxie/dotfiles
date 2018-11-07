#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu
# Notice: 

set -x

REPO_ROOT="https://raw.githubusercontent.com/solomonxie/dotfiles/master"


do_install_docker_apps(){
    # Load uitility functions (check os)
    curl -fsSL $REPO_ROOT/utils.sh -o $HOME/.bash-utils.sh
    source $HOME/.bash-utils.sh

    # Get Distro
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
    #
    # Image: $ docker pull solomonxie/webdav:latest
    mkdir ~/webdav
    sudo chown -R www-data:www-data ~/webdav
    docker run -d --name webdav --restart=always \
        -v ~/webdav:/var/www/webdav \
        -e USERNAME=ubuntu -e PASSWORD=123 \
        -p 8888:80 solomonxie/webdav:latest
}

docker_webdav_rpi(){
    #: <Permission problem>
    # has to get inside container by `docker exec -it webdav sh`
    # and do `chown -R www-data:www-data /var/www/webdav`
    # then edit /etc/fstab to mount drive with uid=www-data,gid=www-data
    mkdir ~/webdav
    sudo chown -R www-data:www-data ~/webdav
    #
    # <Image>: $ docker pull solomonxie/webdav-rpi:latest
    docker run -d --name webdav --restart always \
        -v ~/webdav:/var/www/webdav \
        -e USERNAME=pi -e PASSWORD=123 \
        -p 8888:80 solomonxie/webdav-rpi:jessie
}

docker_wsgidav(){
    #docker run -dt \
    #    --restart always -p 8880:8080 \
    #    -v ~/webdav:/var/wsgidav-root mar10/wsgidav
    #
    #Image: $ docker pull solomonxie/wsgidav:latest
    docker run -dt --name wsgidav --restart always \
        -v ~/.config/wsgidav:/var/wsgidav/configs \
        -v ~/webdav:/var/wsgidav/webdav -v ~/share:/var/wsgidav/share \
        -p 8880:80 solomonxie/wsgidav:latest
}

docker_wsgidav_rpi(){
    #Image: $ docker pull solomonxie/wsgidav-rpi:latest
    docker run -dt --name wsgidav --restart always \
        -v ~/.config/wsgidav:/var/wsgidav/config \
        -v ~/webdav:/var/wsgidav/webdav -v ~/share:/var/wsgidav/share \
        -p 8880:80 solomonxie/wsgidav-rpi:latest
    # Debugging:
    # docker run -it --rm -p 8880:80 -v ~/.config/wsgidav:/var/wsgidav/configs -v ~/webdav:/var/wsgidav/webdav -v ~/share:/var/wsgidav/share solomonxie/wsgidav-rpi
}


docker_shadowsocks(){
    # Image: $ docker pull mritd/shadowsocks
    PORT=6000
    PORT_UPD=6050
    METHOD=aes-256-gcm
    #METHOD=chacha20
    PASSWORD=shadow123
    docker run -dt --name ssserver --restart always \
        -p $PORT:$PORT -p $PORT_UPD:$PORT_UPD/udp mritd/shadowsocks -m "ss-server" \
        -s "-s 0.0.0.0 -p $PORT -m $METHOD -k $PASSWORD --fast-open" \
        -x -e "kcpserver" \
        -k "-t 127.0.0.1:$PORT -l :$PORT_UPD -mode fast2 -key kcp123 -crypt aes-128"
}

docker_shadowsocks_old(){
    # Image: $ docker pull mritd/shadowsocks
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
    # Image: $ docker pull solomonxie/v2ray:latest
    docker run -dt --restart always \
        --name v2ray -p 12345:23456 solomonxie/v2ray:latest \
        /usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
}

docker_vpn_ipsec(){
    # Image: $ docker pull hwdsl2/ipsec-vpn-server:latest
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
    # Image: $ docker pull solomonxie/vpn-ipsec-rpi:latest
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
        -p 7000:7000 -p 8000:7800 \
        -v ~/frp:/conf solomonxie/frp:latest \
        /frp/frps -c /conf/frps.ini

    # Can't run a frp-client in docker ALONE
    # because it's not making any sense
    # it's only okay to run as docker service
    # to connect another container
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
        -v ~/nextcloud/config:/config \
        -v ~/nextcloud/data:/data \
        linuxserver/nextcloud
}

docker_nextcloud_rpi(){
    echo ""
}


docker_emby_ubuntu(){
    # IMAGE: $ docker pull emby/embyserver:latest
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
    #
    # IMAGE: $ docker pull fauria/vsftpd:latest
    docker run -d -v ~/ftpshare:/home/vsftpd \
        -p 20:20 -p 21:21 -p 21100-21110:21100-21110 \
        -e FTP_USER=ubuntu -e FTP_PASS=123 \
        -e PASV_ADDRESS=0.0.0.0 -e PASV_MIN_PORT=21100 -e PASV_MAX_PORT=21110 \
        --name vsftpd --restart=always fauria/vsftpd

}