# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: MacOS Sierra / Ubuntu
# How to run this script:
#    $ sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/shadowsocks/shadowsocks-setup.sh | sh
#
#
# =======SETING UP SHADOWSOCKS =======

cd ~/.init

# Install Shadowsocks
echo "========== (INSTALLING SHADOWSOCKS) ==========="
yes | sudo pip install -U shadowsocks >> log_shadowsocks.txt

# Create config file
echo "========== (CREAT SHADOWSOCK'S CONFIG) ==========="
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/server/shadowsocks/shadowsocks.json -O /etc/shadowsocks.json  >> log_shadowsocks.txt

echo "========== (STARTING SHADOWSOCKS SERVER) ==========="
sudo ssserver -c /etc/shadowsocks.json -d start >> log_shadowsocks.txt
