DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`

# This recipe is for solo-installment, not for "parent" Makefile
install:
	$(MAKE) ${MYOS} plugins

mac:
	brew install zsh

debian:
	sudo apt-get install zsh -y
	@echo "-----[  CHANGE DEFAULT SHELL FOR THIS USER   ]-----"
	sudo usermod -s /bin/zsh ${USER}

ubuntu: debian
raspbian: debian

changeshell:
	sudo usermod -s /bin/zsh ${USER}

plugins: ohmyzsh
	mkdir -p ${HOME}/.zsh/plugins
	mv ${HOME}/.zsh/plugins/zsh-autosuggestions /tmp/ || echo
	git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.zsh/plugins/zsh-autosuggestions
	mv ${HOME}/.zsh/plugins/zsh-syntax-highlighting /tmp/ || echo
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.zsh/plugins/zsh-syntax-highlighting

ohmyzsh:
	if [ ! -e ${HOME}/.oh-my-zsh ]; then \
		echo `curl -sSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh`; \
	fi
	test -e ${HOME}/.oh-my-zsh
