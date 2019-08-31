DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`

# This recipe is for solo-installment, not for "parent" Makefile
install:
	$(MAKE) ${MYOS} plugins

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
	ln -sf ${DOTFILES}/tmux/tmux.conf ~/.tmux.conf
	@echo "OK."

ubuntu: debian
raspbian: debian

checkhealth:
	tmux -V

plugins: checkhealth
	@echo "----------[  Installing TPM for Tmux   ]--------------"
	export TMUX_PLUGIN_MANAGER_PATH='~/.tmux/plugins'
	@if [ ! -e ${HOME}/.tmux/plugins/tpm ]; then \
		mkdir -p ${HOME}/.tmux/plugins; \
		git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm; \
	fi
	${HOME}/.tmux/plugins/tpm/bin/install_plugins
	#Restore tmux session
	ln -sf ${HOME}/.tmux/resurrect/last-${MYOS} ${HOME}/.tmux/resurrect/last
	@echo "OK."
