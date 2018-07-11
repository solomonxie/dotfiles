# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: MacOS Sierra
#
#
#
# =======SETING UP SHADOWSOCKS =======
# Install Shadowsocks
yes | sudo pip install shadowsocks
# Create config file
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
#sudo echo "ssserver -c /etc/shadowsocks.json -d start" >> /etc/rc.local
#sudo cat> /etc/rc.local <<EOF
#    # Shadowsocks
#ssserver -c /etc/shadowsocks.json -d start
#EOF
