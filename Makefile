.PHONY: build

DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`
DT ?= `date +%Y%m%d%s`

configure:
	@configure

build: python tmux zsh vim install

install: configure
	@echo "Installing for [$(MYOS)] now...."
	@echo "make install_$(MYOS)" | sh
	@echo "OK."

python:
	echo "make $(MYOS) -f $(DOTFILES)/python/Makefile" | sh
	@echo "OK."

tmux:
	make tmux -f $(DOTFILES)/tmux/Makefile
	@echo "OK."

zsh:
	make zsh -f $(DOTFILES)/zsh/Makefile
	@echo "OK."

vim:
	make vim -f $(DOTFILES)/vim/Makefile
	@echo "OK."

xx:
	@echo `echo $(RANDOM)`

clean:
	mv ~/.vim /tmp/vim-$(DT)
	mv ~/.vimrc /tmp/vimrc-$(DT)
	mv ~/.tmux /tmp/tmux-$(DT)
	mv ~/.tmux.conf /tmp/tmux-$(DT).conf
	mv ~/.zsh /tmp/zsh-$(DT)
	mv ~/.zshrc /tmp/zshrc-$(DT)

install_mac: clean
	# VIM
	ln -s $(DOTFILES)/vim ~/.vim
	ln -sf $(DOTFILES)/vim/vimrc ~/.vimrc
	# ZSH
	ln -s $(DOTFILES)/zsh ~/.zsh
	ln -sf $(DOTFILES)/zsh/mac.env ~/.zshrc
	# TMUX
	ln -s $(DOTFILES)/tmux ~/.tmux
	ln -sf $(DOTFILES)/tmux/tmux.conf ~/.tmux.conf
	ln -sf $(HOME)/.tmux/resurrect/last-mac.txt $(HOME)/.tmux/resurrect/last
	@echo "OK."

install_ubuntu: clean
	# VIM
	ln -s $(DOTFILES)/vim ~/.vim
	ln -sf $(DOTFILES)/vim/vimrc-mini ~/.vimrc
	# ZSH
	ln -s $(DOTFILES)/zsh ~/.zsh
	ln -sf $(DOTFILES)/zsh/linux.env ~/.zshrc
	# TMU
	ln -s $(DOTFILES)/tmux ~/.tmux
	ln -sf $(DOTFILES)/tmux/tmux/tmux.conf ~/.tmux.conf
	ln -sf $(HOME)/.tmux/resurrect/last-ubuntu.txt $(HOME)/.tmux/resurrect/last
	@echo "OK."

install_raspbian: clean
	# VIM
	ln -s $(DOTFILES)/vim ~/.vim
	ln -sf $(DOTFILES)/vim/vimrc-mini ~/.vimrc
	# ZSH
	ln -s $(DOTFILES)/zsh ~/.zsh
	ln -sf $(DOTFILES)/zsh/linux.env ~/.zshrc
	# TMUX
	ln -s $(DOTFILES)/tmux ~/.tmux
	ln -sf $(DOTFILES)/tmux/tmux/tmux.conf ~/.tmux.conf
	ln -sf $(HOME)/.tmux/resurrect/last-rpi.txt $(HOME)/.tmux/resurrect/last
	@echo "OK."
