#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# Notice: 


docker_webav(){
    # The folder on host MUST have the same permission
    # otherwise it'll cause permission error
    sudo chown -R www-data:www-data ~/webdav
    docker run -d --name webdav --restart always \
        -v ~/webdav:/var/webdav \
        -e USERNAME=ubuntu -e PASSWORD=123 \
        -p 8888:80 morrisjobke/webdav:latest
}

docker_webdav_rpi(){
    docker run -d --name webdav --restart always \
        -v ~/webdav:/var/webdav \
        -e USERNAME=pi -e PASSWORD=123 \
        -p 8888:80 solomonxie/webdav-rpi:jessie
}


docker_shadowsocks(){
    # mritd/shadowsocks
    PORT=6000
    PORT_UPD=6001
    METHOD=aes-256-gcm
    PASSWORD=shadow123
    #METHOD=chacha20
    docker run -dt --name ssserver --restart always \
        -p $PORT:$PORT -p $PORT_UPD:$PORT_UPD/udp mritd/shadowsocks -m "ss-server" \
        -s "-s 0.0.0.0 -p $PORT -m $METHOD -k $PASSWORD --fast-open" \
        -x -e "kcpserver" -k "-t 127.0.0.1:$PORT -l :$PORT_UPD -mode fast2 -key kcp123 -crypt aes-128"
}



docker_smb(){}


docker_jekyll(){}


docker_frp(){}


docker_gitbook(){}


docker_owncloud(){}


docker_v2ray(){
    docker run -dt --restart always \
        --name v2ray -p 12345:23456 solomonxie/v2ray:latest \
        /usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
}

docker_ftp(){
    # Remember to connect with port 21
    docker run -d -v ~/ftpshare:/home/vsftpd \
        -p 20:20 -p 21:21 -p 21100-21110:21100-21110 \
        -e FTP_USER=ubuntu -e FTP_PASS=123 \
        -e PASV_ADDRESS=0.0.0.0 -e PASV_MIN_PORT=21100 -e PASV_MAX_PORT=21110 \
        --name vsftpd --restart=always fauria/vsftpd
    # Volume's owner in container is ftp:ftp
    # shouldn't change ownership from HOST
}