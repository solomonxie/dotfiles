DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`

ohmyzsh:
	if [ -e $(HOME)/.oh-my-zsh ]; then \
		echo `curl -sSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh`; \
    fi

plugins: ohmyzsh
	mkdir -p $(HOME)/.zsh
	git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting

changeshell:
	sudo usermod -s /bin/zsh $ME

mac:
	brew install zsh

debian:
	sudo apt-get install zsh -y
	@echo "-----[  CHANGE DEFAULT SHELL FOR THIS USER   ]-----"
	sudo usermod -s /bin/zsh $(ME)

ubuntu: debian
raspbian: debian
