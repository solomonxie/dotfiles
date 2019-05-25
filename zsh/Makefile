DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`

mac:
	brew install zsh

debian:
	sudo apt-get install zsh -y
	@echo "-----[  CHANGE DEFAULT SHELL FOR THIS USER   ]-----"
	sudo usermod -s /bin/zsh $(USER)

ubuntu: debian
raspbian: debian

changeshell:
	sudo usermod -s /bin/zsh $(USER)

plugins: ohmyzsh
	mkdir -p $(HOME)/.zsh/plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions $(HOME)/.zsh/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(HOME)/.zsh/plugins/zsh-syntax-highlighting

ohmyzsh:
	if [ -e $(HOME)/.oh-my-zsh ]; then \
		echo `curl -sSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh`; \
    fi
	test -e $(HOME)/.oh-my-zsh


install:
	@echo "make $(MYOS) plugins" | sh
