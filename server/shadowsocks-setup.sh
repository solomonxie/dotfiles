# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: MacOS Sierra / Ubuntu
#
#
#
# =======SETING UP SHADOWSOCKS =======
# Install Shadowsocks
echo "========== (INSTALLING SHADOWSOCKS) ==========="
yes | sudo pip install shadowsocks
# Create config file
echo "========== (OVERWRITING SHADOWSOCK'S CONFIG) ==========="
sudo cat> /etc/shadowsocks.json <<EOF
{
    "server":"0.0.0.0",
    "server_port": 1988,
    "password":"shadow123",
    "local_address":"127.0.0.1",
    "method":"aes-256-cfb",
    "local_port":1080,
    "timeout":300,
    "fast_open":false
}
EOF
# Auto start Shadowsocks service when system starts
echo "========== (ADD SHADOWSOCKS TO SYSTEM START) ==========="
sudo cat> /etc/rc.local <<EOF
#!/bin/sh -e

sudo ssserver -c /etc/shadowsocks.json -d start

exit 0;
EOF

echo "========== (STARTING SHADOWSOCKS SERVER) ==========="
ssserver -c /etc/shadowsocks.json -d start
