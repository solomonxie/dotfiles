# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: MacOS Sierra / Ubuntu
# How to run this script:
#    $ curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/shadowsocks/sslocal-setup-rpi.sh | sh
#
#
# ---SETING UP SHADOWSOCKS LOCAL CLIENT---


# Install Shadowsocks
echo "-----[  INSTALLING SHADOWSOCKS   ]-----"
yes | pip install -U shadowsocks

# Create config file
echo "-----[  CREAT SHADOWSOCK'S CONFIG   ]-----"
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/shadowsocks/sslocal.json -O /etc/sslocal.json

echo "-----[  STARTING SHADOWSOCKS SERVER   ]-----"
sudo sslocal -c /etc/sslocal.json -d start
