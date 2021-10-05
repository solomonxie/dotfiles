#######################################################################
#                         VIM - make install                          #
#######################################################################
include envfile
include envfile-local

DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`

# This recipe is for solo-installment, not for "parent" Makefile
install:
	$(MAKE) ${MYOS}

checkhealth:
	python -V
	python3 -V
	pip -V
	pip3 -V

checkhealth_mac:
	brew --version

checkhealth_debian:
	apt-get --version

mac: checkhealth_mac
	brew install vim
	brew install ctags
	brew install --HEAD universal-ctags/universal-ctags/universal-ctags

debian: checkhealth_debian
	sudo apt-get install vim -y
	sudo apt-get install ctags -y

ubuntu: debian
raspbian: debian
