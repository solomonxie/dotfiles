DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`

checkhealth_mac:
	brew --version
	git --version

checkhealth_debian:
	apt-get --version
	git --version

mac: checkhealth_mac
	brew install tmux
	@echo "OK."

debian: checkhealth_debian
	sudo apt-get install tmux -y
	@echo "OK."

ubuntu: debian
raspbian: debian

checkhealth:
	tmux -V

plugins: checkhealth
	@echo "----------[  Installing TPM for Tmux   ]--------------"
	@if [ ! -e $(HOME)/.tmux/plugins/tpm ]; then \
		mkdir -p $(HOME)/.tmux/plugins; \
		git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm; \
	fi
	$(HOME)/.tmux/plugins/tpm/bin/install_plugins
	@echo "OK."

install:
	@echo "make $(MYOS); make plugins" | sh
