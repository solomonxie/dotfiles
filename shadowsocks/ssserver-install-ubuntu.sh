# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# How to run this script:
#    $ curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/shadowsocks/ssserver-setup-ubuntu.sh | sudo sh
#
#
# ---SETING UP SHADOWSOCKS SERVER ---


# Install Shadowsocks
echo "-----[  INSTALLING SHADOWSOCKS   ]-----"
yes | sudo pip install -U shadowsocks >> ~/.init/log_shadowsocks.txt

# Create config file
echo "-----[  CREAT SHADOWSOCK'S CONFIG   ]-----"
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/shadowsocks/ssserver.json -O /etc/ssserver.json  >> ~/.init/log_shadowsocks.txt

echo "-----[  STARTING SHADOWSOCKS SERVER   ]-----"
sudo ssserver -c /etc/ssserver.json -d start >> ~/log_ssserver.txt
