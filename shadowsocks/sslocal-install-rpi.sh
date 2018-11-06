# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: MacOS Sierra / Ubuntu
# How to run this script:
#    $ curl -L $REPO_ROOT//shadowsocks/sslocal-setup-rpi.sh | sh
#
#
# ---SETING UP SHADOWSOCKS LOCAL CLIENT---

set -x

REPO_ROOT="https://raw.githubusercontent.com/solomonxie/dotfiles/master"


# Install Shadowsocks
echo "-----[  INSTALLING SHADOWSOCKS   ]-----"
yes | pip install -U shadowsocks

# Create config file
echo "-----[  CREAT SHADOWSOCK'S CONFIG   ]-----"
sudo wget $REPO_ROOT//shadowsocks/sslocal.json -O /etc/sslocal.json

echo "-----[  STARTING SHADOWSOCKS SERVER   ]-----"
sudo sslocal -c /etc/sslocal.json -d start
