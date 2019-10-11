#########################################################
#             ____             _                        #
#            |  _ \  ___   ___| | _____ _ __            #
#            | | | |/ _ \ / __| |/ / _ \ '__|           #
#            | |_| | (_) | (__|   <  __/ |              #
#            |____/ \___/ \___|_|\_\___|_|              #
#                                                       #
#########################################################

DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`


# This recipe is for solo-installment, not for "parent" Makefile
install:
	$(MAKE) ${MYOS} apps_${MYOS}

ubuntu: quick_build docker_compose add_permission
mac:
	@echo "Mac: has to install from GUI"

quick_build:
	curl -fsSL get.docker.com -o /tmp/get-docker.sh && sudo sh /tmp/get-docker.sh
	#sudo sh ${HOME}/dotfiles/docker/get-docker.sh

debian_build: checkhealth_debian
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

add_permission:
	#Add Permission
	sudo groupadd docker || echo
	sudo gpasswd -a ${USER} docker
	newgrp docker

docker_compose:
	sudo apt-get install docker-compose -y




###############################################################
#                                                             #
#  ____             _                  _                      #
# |  _ \  ___   ___| | _____ _ __     / \   _ __  _ __  ___   #
# | | | |/ _ \ / __| |/ / _ \ '__|   / _ \ | '_ \| '_ \/ __|  #
# | |_| | (_) | (__|   <  __/ |     / ___ \| |_) | |_) \__ \  #
# |____/ \___/ \___|_|\_\___|_|    /_/   \_\ .__/| .__/|___/  #
#                                          |_|   |_|          #
#                                                             #
###############################################################

apps_mac:

apps_raspbian: webav_raspbian

apps_ubuntu: vpn_ipsec shadowsocks webdav frp

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


shadowsocks: ss
ss: checkhealth_docker
	# Stable
	docker run -d -p 1988:8388 -e METHOD=aes-256-cfb --name "ss1988" \
		-e PASSWORD=shadow123 shadowsocks/shadowsocks-libev
	docker run -d -p 6000:8388 -e METHOD=aes-256-gcm --name "ss6000" \
		-e PASSWORD=shadow123 shadowsocks/shadowsocks-libev
	# docker run -d -p 16000:8388 -e METHOD=aes-256-gcm --name "ss1600" \
	# 	-e PASSWORD=shadow123 shadowsocks/shadowsocks-libev
	# docker run -d -p 16001:8388 -e METHOD=aes-256-gcm --name "ss16001" \
	# 	-e PASSWORD=shadow123 shadowsocks/shadowsocks-libev
	# docker run -d -p 16002:8388 -e METHOD=aes-256-gcm --name "ss16002" \
	# 	-e PASSWORD=shadow123 shadowsocks/shadowsocks-libev
	# Experimental
	docker run -d -p 17008:8388 -e METHOD=chacha20-ietf-poly1305 --name "ss17001" \
		-e PASSWORD=shadow123 shadowsocks/shadowsocks-libev
	# docker run -d -p 17001:8388 -e METHOD=aes-128-gcm --name "ss17002" \
	# 	-e PASSWORD=shadow123 shadowsocks/shadowsocks-libev
	# docker run -d -p 17003:8388 -e METHOD=camellia-256-cfb --name "ss17003" \
	# 	-e PASSWORD=shadow123 shadowsocks/shadowsocks-libev
	# docker run -d -p 17004:8388 -e METHOD=chacha20 --name "ss17004" \
	# 	-e PASSWORD=shadow123 shadowsocks/shadowsocks-libev
	# docker run -d -p 17005:8388 -e METHOD=rc4-md5 --name "ss17005" \
	# 	-e PASSWORD=shadow123 shadowsocks/shadowsocks-libev
	# docker run -d -p 17006:8388 -e METHOD=salsa20 --name "ss17006" \
	# 	-e PASSWORD=shadow123 shadowsocks/shadowsocks-libev
	# docker run -d -p 17007:8388 -e METHOD=bf-cfb --name "ss17007" \
	# 	-e PASSWORD=shadow123 shadowsocks/shadowsocks-libev
	# docker run -d -p 17002:8388 -e METHOD=aes-256-ctr --name "ss17008" \
	# 	-e PASSWORD=shadow123 shadowsocks/shadowsocks-libev
	# docker run -d -p 17009:8388 -e METHOD=camellia-128-cfb --name "ss17009" \
	# 	-e PASSWORD=shadow123 shadowsocks/shadowsocks-libev

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
	sudo mkdir $(HOME)/webdav | echo
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
	sudo mkdir /var/webdav | echo
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
	docker run --name ipsec_server --restart always \
	    -p 500:500/udp -p 4500:4500/udp \
	    -v /lib/modules:/lib/modules:ro \
		-d --privileged -e "VPN_USER=ipsec" \
		-e "VPN_PASSWORD=ipsec123" -e "VPN_IPSEC_PSK=psk123" \
	    hwdsl2/ipsec-vpn-server

vpn_ipsec_pi: checkhealth_docker
	# Image: $ docker pull solomonxie/vpn-ipsec-rpi:latest
	docker run --name ipsec_server --restart always \
	    -p 500:500/udp -p 4500:4500/udp \
	    -v /lib/modules:/lib/modules:ro \
		-d --privileged -e "VPN_USER=ipsec" \
		-e "VPN_PASSWORD=ipsec123" -e "VPN_IPSEC_PSK=psk123" \
	    solomonxie/vpn-ipsec-rpi

playground_raspbian: checkhealth_docker
	docker run -it --name ubuntu solomonxie/rpi-init:jessie bash

playground_ubuntu: checkhealth_docker
	docker run -it --name ubuntu solomonxie/lightsail:ubuntu-1604 bash
