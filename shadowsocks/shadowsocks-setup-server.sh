# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: MacOS Sierra / Ubuntu
# How to run this script:
#    $ sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/shadowsocks/shadowsocks-setup.sh | sh
#
#
# ---SETING UP SHADOWSOCKS ---

cd ~/.init

# Install Shadowsocks
echo "-----[  INSTALLING SHADOWSOCKS   ]-----"
yes | sudo pip install -U shadowsocks >> log_shadowsocks.txt

# Create config file
echo "-----[  CREAT SHADOWSOCK'S CONFIG   ]-----"
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/shadowsocks/ssserver.json -O /etc/ssserver.json  >> log_shadowsocks.txt

echo "-----[  STARTING SHADOWSOCKS SERVER   ]-----"
sudo ssserver -c /etc/ssserver.json -d start >> log_shadowsocks.txt
