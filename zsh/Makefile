#######################################################################
#                         ZSH - make install                          #
#######################################################################

DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`

# This recipe is for solo-installment, not for "parent" Makefile
install:
	$(MAKE) ${MYOS} ohmyzsh
	$(MAKE) ${MYOS} plugins
	ln -sf $(DOTFILES)/zsh/zshrc-mini.sh ~/.zshrc

mac:
	brew install zsh

debian:
	sudo apt-get install zsh -y
	@echo "-----[  CHANGE DEFAULT SHELL FOR THIS USER   ]-----"
	# sudo usermod -s /bin/zsh ${USER}

ubuntu: debian
raspbian: debian

changeshell:
	sudo usermod -s /bin/zsh ${USER}

ohmyzsh:
	# Archive(Backup)
	mv ~/.oh-my-zsh ~/.oh-my-zsh_`date +%F`  || True
	# Install
	git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
	test -e ${HOME}/.oh-my-zsh

plugins:
	mkdir -p ${HOME}/.zsh/plugins || True
	mv ${HOME}/.zsh/plugins/zsh-autosuggestions /tmp/ || True
	git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.zsh/plugins/zsh-autosuggestions
	mv ${HOME}/.zsh/plugins/zsh-syntax-highlighting /tmp/ || True
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.zsh/plugins/zsh-syntax-highlighting
