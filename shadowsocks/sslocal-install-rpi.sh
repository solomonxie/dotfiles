# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# ENVIRONMENT: Ubuntu / Raspbian
#
# How to run this script:
#    $ curl -L $REPO_URL//shadowsocks/sslocal-setup-rpi.sh | sh
#
#
# ---SETING UP SHADOWSOCKS LOCAL CLIENT---

set -x

REPO_URL="https://raw.githubusercontent.com/solomonxie/dotfiles/master"


# Install Shadowsocks
echo "-----[  INSTALLING SHADOWSOCKS   ]-----"
yes | pip install -U shadowsocks

# Create config file
echo "-----[  CREAT SHADOWSOCK'S CONFIG   ]-----"
sudo wget $REPO_URL//shadowsocks/sslocal.json -O /etc/sslocal.json

echo "-----[  STARTING SHADOWSOCKS SERVER   ]-----"
sudo sslocal -c /etc/sslocal.json -d start
