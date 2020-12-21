
# Need to switch with `sudo -i` to root user first

bbr:
	wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"
	chmod +x tcp.sh
	./tcp.sh


shadowsocks:
	wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
	chmod +x shadowsocks-all.sh
	./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log

v2ray:
	bash <(curl -s -L https://git.io/v2ray.sh)
