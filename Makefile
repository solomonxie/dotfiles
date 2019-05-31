.PHONY: configure-it python-it tmux-it zsh-it vim-it docker-it install

DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`
DT ?= `date +%Y%m%d%s`

install:
	@echo "Installing for [${MYOS}] now...."
	@echo "make install_${MYOS}" | sh
	@echo "OK."

configure-it:
	./configure

save:
	#mv ${DOTFILES}/tmux/resurrect/tmux_resurrect_20190525T173225.txt ${DOTFILES}/tmux/resurrect/last

python-it:
	@cd python/
	echo "make ${MYOS}" | sh
	@cd ..
	@echo "OK."

tmux-it:
	@cd tmux/
	echo "make ${MYOS}" | sh
	@cd ..
	@echo "OK."

zsh-it:
	@cd zsh/
	echo "make ${MYOS}" | sh
	@cd ..
	@echo "OK."

vim-it:
	@cd vim/
	echo "make ${MYOS}" | sh
	@cd ..
	@echo "OK."

docker-it:
	@cd docker/
	echo "make ${MYOS}" | sh
	echo "make apps_${MYOS}" | sh
	@cd ..
	@echo "OK."


checkhealth:
	ls ~/.vim
	ls ~/.vimrc
	ls ~/.tmux
	ls ~/.tmux.conf
	ls ~/.zsh
	ls ~/.zshrc
	ls ~/.tmux/resurrect/last

clean: checkhealth
	mv ~/.vim /tmp/vim-$(DT)
	mv ~/.vimrc /tmp/vimrc-$(DT)
	mv ~/.tmux /tmp/tmux-$(DT)
	mv ~/.tmux.conf /tmp/tmux-$(DT).conf
	mv ~/.zsh /tmp/zsh-$(DT)
	mv ~/.zshrc /tmp/zshrc-$(DT)

install_mac: clean
	# VIM
	ln -s ${DOTFILES}/vim ~/.vim
	ln -sf ${DOTFILES}/vim/vimrc ~/.vimrc
	# ZSH
	ln -s ${DOTFILES}/zsh ~/.zsh
	ln -sf ${DOTFILES}/zsh/mac.env ~/.zshrc
	# TMUX
	ln -s ${DOTFILES}/tmux ~/.tmux
	ln -sf ${DOTFILES}/tmux/tmux.conf ~/.tmux.conf
	ln -sf ${HOME}/.tmux/resurrect/last-mac.txt ${HOME}/.tmux/resurrect/last
	@echo "OK."

install_ubuntu: clean
	# VIM
	ln -s ${DOTFILES}/vim ~/.vim
	ln -sf ${DOTFILES}/vim/vimrc-mini ~/.vimrc
	# ZSH
	ln -s ${DOTFILES}/zsh ~/.zsh
	ln -sf ${DOTFILES}/zsh/linux.env ~/.zshrc
	# TMU
	ln -s ${DOTFILES}/tmux ~/.tmux
	ln -sf ${DOTFILES}/tmux/tmux.conf ~/.tmux.conf
	ln -sf ${HOME}/.tmux/resurrect/last-ubuntu.txt ${HOME}/.tmux/resurrect/last
	@echo "OK."

install_raspbian: clean
	# VIM
	ln -s ${DOTFILES}/vim ~/.vim
	ln -sf ${DOTFILES}/vim/vimrc-mini ~/.vimrc
	# ZSH
	ln -s ${DOTFILES}/zsh ~/.zsh
	ln -sf ${DOTFILES}/zsh/linux.env ~/.zshrc
	# TMUX
	ln -s ${DOTFILES}/tmux ~/.tmux
	ln -sf ${DOTFILES}/tmux/tmux.conf ~/.tmux.conf
	ln -sf ${HOME}/.tmux/resurrect/last-raspbian.txt ${HOME}/.tmux/resurrect/last
	@echo "OK."
