.PHONY: build

DOTFILES ?= ~/dotfiles

build: python tmux zsh vim

install:
	# VIM
	ln -sf $(DOTFILES)/vim ~/.vim
	ln -sf $(DOTFILES)/vim/vimrc ~/.vimrc
	# ZSH
	ln -sf $(DOTFILES)/zsh/mac.env ~/.zshrc
	# TMUX
	ln -sf $(DOTFILES)/tmux ~/.tmux
	ln -sf $(DOTFILES)/tmux/tmux.conf ~/.tmux.conf
	ln -sf $(HOME)/.tmux/resurrect/last-mac.txt $(HOME)/.tmux/resurrect/last
	@echo "OK."

install_ubuntu:
	# VIM
	ln -sf $(DOTFILES)/vim ~/.vim
	ln -sf $(DOTFILES)/vim/vimrc-mini ~/.vimrc
	# ZSH
	ln -sf $(DOTFILES)/zsh/linux.env ~/.zshrc
	# TMUX
	ln -sf $(DOTFILES)/tmux ~/.tmux
	ln -sf $(DOTFILES)/tmux/tmux ~/.tmux.conf
	ln -sf $(HOME)/.tmux/resurrect/last-ubuntu.txt $(HOME)/.tmux/resurrect/last
	@echo "OK."

install_rpi:
	# VIM
	ln -sf $(DOTFILES)/vim ~/.vim
	ln -sf $(DOTFILES)/vim/vimrc-mini ~/.vimrc
	# ZSH
	ln -sf $(DOTFILES)/zsh/linux.env ~/.zshrc
	# TMUX
	ln -sf $(DOTFILES)/tmux ~/.tmux
	ln -sf $(DOTFILES)/tmux/tmux ~/.tmux.conf
	ln -sf $(HOME)/.tmux/resurrect/last-rpi.txt $(HOME)/.tmux/resurrect/last
	@echo "OK."


python:
	make python -f $(DOTFILES)/python/Makefile
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
