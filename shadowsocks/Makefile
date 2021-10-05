#!make
include envfile
include envfile-local

DOTFILES ?= ~/myconf/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`

install:


install_debian:
	sudo apt install shadowsocks-libev -y

install_server:
	pip install --user shadowsocks
	sudo wget ${DOTFILES}/shadowsocks/ssserver.json -O /etc/ssserver.json

install_raspbian: checkhealth_raspbian install_debian install_local_service_raspbian

install_ubuntu: checkhealth_ubuntu install_debian
	pip install --user shadowsocks
	sudo ssserver -c /etc/ssserver.json -d start

install_local_service_raspbian:
	sudo cp ${DOTFILES}/shadowsocks/sslocal.json /etc/shadowsocks-libev/ss-local.json
	sudo cp ${DOTFILES}/shadowsocks/ss-local.service /etc/systemd/system/ss-local.service
	sudo ln -sf /usr/bin/ss-local /usr/sbin/ss-local
	sudo systemctl enable ss-local.service
	sudo systemctl start ss-local.service
	sudo systemctl status ss-local.service


checkhealth_mac:
	brew --version

checkhealth_debian:
	dpkg --version
	apt --version
	apt-get --version
	pip -V
	wget --version
	curl --version

checkhealth_raspbian: checkhealth_debian
checkhealth_ubuntu: checkhealth_debian



