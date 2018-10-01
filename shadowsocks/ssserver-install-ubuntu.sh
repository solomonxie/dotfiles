# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# How to run this script:
#    $ curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/shadowsocks/ssserver-setup-ubuntu.sh | sudo sh
#
#
# ---SETING UP SHADOWSOCKS SERVER ---



do_install_ssserver_manually(){
    # Install Shadowsocks
    echo "-----[  INSTALLING SHADOWSOCKS   ]-----"
    yes | pip install -U shadowsocks

    # Create config file
    echo "-----[  CREAT SHADOWSOCK'S CONFIG   ]-----"
    sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/shadowsocks/ssserver.json -O /etc/ssserver.json

    echo "-----[  STARTING SHADOWSOCKS SERVER   ]-----"
    sudo ssserver -c /etc/ssserver.json -d start
}

do_install_ssserver_docker(){
    docker run -dt --name ssserver --restart always \
    -p 6443:6443 -p 6500:6500/udp mritd/shadowsocks -m "ss-server" \
    -s "-s 0.0.0.0 -p 6443 -m chacha20 -k shadow123 --fast-open" \
    -x -e "kcpserver" -k "-t 127.0.0.1:6443 -l :6500 -mode fast2 -key kcp123 -crypt aes-128"
}

do_install_ssserver_manually
do_install_ssserver_docker
