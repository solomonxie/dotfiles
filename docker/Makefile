DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`

install:
	curl -fsSL get.docker.com -o /tmp/get-docker.sh && sudo sh /tmp/get-docker.sh
	#sudo sh ${HOME}/dotfiles/docker/get-docker.sh

debian: checkhealth_debian
	# Setup SSL for downloading through HTTPS
	sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
	# Add GPG key for docker
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	# Checkup the key（9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88）
	sudo apt-key fingerprint 0EBFCD88
	# Add source for apt-get
	sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu ${lsb_release -cs} stable"
	sudo apt-get update
	# Install docker
	sudo apt-get install docker-ce -y
	# Hello-world
	sudo docker run hello-world

ubuntu: install
	sudo apt-get install docker-compose -y
	#Add Permission
	sudo groupadd docker
	sudo gpasswd -a ${USER} docker
	newgrp docker
	/bin/bash


###################### APPs ##########################


apps_mac:

apps_raspbian: webav_raspbian playground_raspbian

apps_ubuntu: shadowsocks shadowsocks_old webdav frp vpn_ipsec playground_ubuntu

checkhealth_debian:
	apt-get --version
	apt --version
	curl --version
	wget --version
	ping hub.docker.com
	docker login

checkhealth_docker:
	docker -v
	docker-compose -v

checkhealth_raspbian: checkhealth_docker
checkhealth_ubuntu:


shadowsocks: checkhealth_docker
	# Image: $ docker pull mritd/shadowsocks PORT=6000
	docker run -dt --name ssserver --restart always \
		-p 6000:6000 -p 6000:6000/udp mritd/shadowsocks -m "ss-server" \
	    -s "-s 0.0.0.0 -p 6000 -m aes-256-gcm -k shadow123 --fast-open" \
	    -x -e "kcpserver" \
	    -k "-t 127.0.0.1:6000 -l 6000 -mode fast2 -key kcp123 -crypt aes-128"

shadowsocks_old: checkhealth_docker
	# Image: $ docker pull mritd/shadowsocks
	docker run -dt --name ssserver-old --restart always \
		-p 1988:1988 -p 1988:1988/udp mritd/shadowsocks -m "ss-server" \
	    -s "-s 0.0.0.0 -p 1988 -m aes-256-cfb -k shadow123 --fast-open" \
	    -x -e "kcpserver" -k "-t 127.0.0.1:1988 -l 1988 -mode fast2 -key kcp123 -crypt aes-128"

shadowsocks_libev_local: checkhealth_docker
	docker run -dt -e PASSWORD=shadow123 \
		-p 6000:6000 -p 6000:6000/udp \
	    shadowsocks/shadowsocks-libev

v2ray: checkhealth_docker
	# Image: $ docker pull solomonxie/v2ray:latest
	docker run -dt --restart always \
	    --name v2ray -p 12345:23456 solomonxie/v2ray:latest \
	    /usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json

webdav: checkhealth_docker
	# The folder on host MUST have the same permission
	# otherwise it'll cause permission error
	# Permission problem:
	# has to get inside container by `docker exec -it webdav sh`
	# and do `chown -R www-data:www-data /var/www/webdav`
	#
	# Image: $ docker pull solomonxie/webdav:latest
	sudo mkdir $(HOME)/webdav
	sudo chown -R $(USER):www-data $(HOME)/webdav
	#sudo chmod -R g+s ${HOME}/webdav
	docker run -d --name webdav --restart=always \
	    -v $(HOME)/webdav:/var/www/webdav \
	    -e USERNAME=$(USER) -e PASSWORD=123 \
	    -p 8888:80 solomonxie/webdav:latest

webav_raspbian: checkhealth_docker
	#: <Permission problem>
	# has to get inside container by `docker exec -it webdav sh`
	# and do `chown -R www-data:www-data /var/www/webdav`
	sudo mkdir /var/webdav
	ln -sf /var/webdav $(HOME)/webdav
	sudo chown -R $(USER):www-data /var/webdav
	#sudo chmod -R g+s ${HOME}/webdav
	#
	# <Image>: $ docker pull solomonxie/webdav-rpi:latest
	docker run -dt --name webdav --restart=always \
	    -v ${HOME}/docker-rpi/:/config \
	    -v ${HOME}/webdav:/var/www/webdav \
	    -e USERNAME=${USER} -e PASSWORD=123 \
	    -p 8888:80 solomonxie/webdav-rpi:jessie

frp: checkhealth_docker
	#frp-server
	#Image: $ docker pull solomonxie/frp:latest
	docker run -dt --name frps \
	    -p 7000:7000 -p 7500:7500 -p 7800:7800 \
	    -v ${HOME}/dotfiles/frp:/conf solomonxie/frp:latest \
	    /frp/frps -c /conf/frps.ini
	# How docker FRP works:
	# Client(8888) -> FRP-Docker(7888) -> Server(7888) -> Browser(7888)
	# Client(22) -> FRP-Docker(2200) -> Server(7022) -> Browser(7022)
	# Client(5901) -> FRP-Docker(7901) -> Server(7901) -> Browser(7901)
	#
	#-> 7000 as entry point
	#-> 7500 as Admin web page
	#-> 7800 as webdav mapper
	#-> 7901 as VNC desktop port
	#-> 7022 as SSH port
	#-> 4500 as VPN port
	#--------------------------------------
	# Can't run a frp-client in docker ALONE
	# because it's not making any sense
	# it's only okay to run as docker service
	# to connect another container
	#--------------------------------------

vpn_ipsec: checkhealth_docker
	# Image: $ docker pull hwdsl2/ipsec-vpn-server:latest
	mkdir -p ${HOME}/.config
	touch ${HOME}/.config/vpn.env
	@echo "VPN_USER=ubuntu" >> ${HOME}/.config/vpn.env
	@echo "VPN_PASSWORD=ipsec123" >> ${HOME}/.config/vpn.env
	@echo "VPN_IPSEC_PSK=pre-password123" >> ${HOME}/.config/vpn.env
	docker run \
	    --name vpn --restart always \
	    -p 500:500/udp -p 4500:4500/udp \
	    -v /lib/modules:/lib/modules:ro \
	    --env-file ${HOME}/.config/vpn.env -d --privileged \
	    hwdsl2/ipsec-vpn-server

vpn_ipsec_raspbian: checkhealth_docker
	# Image: $ docker pull solomonxie/vpn-ipsec-rpi:latest
	mkdir -p ${HOME}/.config
	touch ${HOME}/.config/vpn.env
	@echo "VPN_USER=ubuntu" >> ${HOME}/.config/vpn.env
	@echo "VPN_PASSWORD=ipsec123" >> ${HOME}/.config/vpn.env
	@echo "VPN_IPSEC_PSK=pre-password123" >> ${HOME}/.config/vpn.env
	docker run \
	    --name vpn --restart always \
	    -p 500:500/udp -p 4500:4500/udp \
	    -v /lib/modules:/lib/modules:ro \
	    --env-file ${HOME}/.config/vpn.env -d --privileged \
	    solomonxie/vpn-ipsec-rpi

playground_raspbian: checkhealth_docker
	docker run -it --name ubuntu solomonxie/rpi-init:jessie bash

playground_ubuntu: checkhealth_docker
	docker run -it --name ubuntu solomonxie/lightsail:ubuntu-1604 bash
