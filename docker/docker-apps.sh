#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# Notice: 


docker_webav(){
    docker run -d --name webdav --restart always \
        -v ~/webdav:/var/webdav \
        -e USERNAME=ubuntu -e PASSWORD=123 \
        -p 8888:80 morrisjobke/webdav
}

docker_webdav_rpi(){
    docker run -d --name webdav --restart always \
        -v ~/webdav:/var/webdav \
        -e USERNAME=pi -e PASSWORD=123 \
        -p 8888:80 solomonxie/webdav-rpi:jessie
}


docker_shadowsocks(){
    # mritd/shadowsocks
    PORT=1990
    PORT_UPD=1991
    METHOD=chacha20
    docker run -dt --name ssserver --restart always \
        -p $PORT:$PORT -p $PORT_UPD:$PORT_UPD/udp mritd/shadowsocks -m "ss-server" \
        -s "-s 0.0.0.0 -p $PORT -m $METHOD -k shadow123 --fast-open" \
        -x -e "kcpserver" -k "-t 127.0.0.1:$PORT -l :$PORT_UPD -mode fast2 -key kcp123 -crypt aes-128"
}



docker_smb(){}


docker_jekyll(){}


docker_frp(){}


docker_gitbook(){}


docker_owncloud(){}


docker_v2ray(){}



