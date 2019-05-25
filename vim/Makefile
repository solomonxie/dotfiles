DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`

install:
	@echo "make $(MYOS)" | sh
	vim +PlugInstall +qall

checkhealth:
	python -V
	python3 -V
	pip -V
	pip3 -V

checkhealth_mac:
	brew --version

checkhealth_debian:
	apt-get --version

mac: checkhealth_mac plugin_deoplete
	brew install vim
	brew install ctags
	brew install --HEAD universal-ctags/universal-ctags/universal-ctags

debian: checkhealth_debian
	sudo apt-get install vim -y
	sudo apt-get install ctags -y

ubuntu: debian
raspbian: debian

plugin_deoplete: checkhealth
	pip3 install --user pynvim
	pip3 install --user neovim
