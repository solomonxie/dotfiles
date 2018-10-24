#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# Notice: 


docker_webav(){
    # The folder on host MUST have the same permission
    # otherwise it'll cause permission error
    # Permission problem: 
    # has to get inside container by `docker exec -it webdav sh`
    # and do `chown -R www-data:www-data /var/www/webdav`
    sudo chown -R www-data:www-data ~/webdav
    docker run -d --name webdav --restart always \
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


docker_shadowsocks(){
    # mritd/shadowsocks
    PORT=6000
    PORT_UPD=6001
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

docker_vpn_cisco_ipsec(){
    touch ~/.vpn.env
    echo "VPN_USER=ubuntu" >> ~/.vpn.env
    echo "VPN_PASSWORD=password123" >> ~/.vpn.env
    echo "VPN_IPSEC_PSK=pre-password123" >> ~/.vpn.env
    docker run \
        --name vpn --restart=always \
        -p 500:500/udp -p 4500:4500/udp \
        -v /lib/modules:/lib/modules:ro \
        --env-file ~/.vpn.env -d --privileged \
        hwdsl2/ipsec-vpn-server
}


docker_smb(){}


docker_jekyll(){}


docker_frp(){}


docker_gitbook(){}


docker_owncloud(){}


docker_nextcloud_sqlite(){
    # Get current UID by `$ id -u $USER`
    # Get current GID by `$ id -g $USER`
    docker run -dt \
        --name nextcloud \
        -p 8080:80 -p 8443:443\
        -e PUID=1000 -e PGID=1000 \
        -v ~/nextcloud/config:/config \
        -v ~/nextcloud/data:/data \
        linuxserver/nextcloud
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