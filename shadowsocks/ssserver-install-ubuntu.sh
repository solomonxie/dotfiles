# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# How to run this script:
#    $ curl -L https://raw.githubusercontent.com/solomonxie/dotfiles/master/shadowsocks/ssserver-setup-ubuntu.sh | sudo sh
#
#
# ---SETING UP SHADOWSOCKS SERVER ---



do_install_ssserver_manually(){
    # Install Shadowsocks
    echo "-----[  INSTALLING SHADOWSOCKS   ]-----"
    yes | pip install -U shadowsocks

    # Create config file
    echo "-----[  CREAT SHADOWSOCK'S CONFIG   ]-----"
    sudo wget https://raw.githubusercontent.com/solomonxie/dotfiles/master/shadowsocks/ssserver.json -O /etc/ssserver.json

    echo "-----[  STARTING SHADOWSOCKS SERVER   ]-----"
    sudo ssserver -c /etc/ssserver.json -d start
}

do_install_ssserver_docker(){
    PORT=1990
    PORT_UPD=1991
    docker run -dt --name ssserver --restart always \
    -p $PORT:$PORT -p $PORT_UPD:$PORT_UPD/udp mritd/shadowsocks -m "ss-server" \
    -s "-s 0.0.0.0 -p $PORT -m chacha20 -k shadow123 --fast-open" \
    -x -e "kcpserver" -k "-t 127.0.0.1:$PORT -l :$PORT_UPD -mode fast2 -key kcp123 -crypt aes-128"
}

do_install_ssserver_manually
do_install_ssserver_docker
