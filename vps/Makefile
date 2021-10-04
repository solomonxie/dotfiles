root:
	sudo su root

bbr: root
	wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"
	chmod +x tcp.sh
	./tcp.sh


shadowsocks: root
	wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
	chmod +x shadowsocks-all.sh
	./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log

v2ray: root
	bash <(curl -s -L https://git.io/v2ray.sh)


efs: root
	apt install nfs-common -y
	mkdir /myefs
	sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport THE_IP_OF_EFS:/ /myefs
	sudo chmod go+rw /myefs
	ls -lah /myefs
	touch /myefs/README.txt
