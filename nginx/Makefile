DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`
DT ?= `date +%Y%m%d%s`


install:
	$(MAKE) ${MYOS}

ubuntu:
	yes| sudo apt install nginx
	sudo service nginx status


simpleshare:
	sudo mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf_bak_`date +%F`
	sudo cp ./simple_file_server/nginx.conf /etc/nginx/nginx.conf
	sudo service nginx restart
	sudo service nginx status
