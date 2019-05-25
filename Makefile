.PHONY: build

DOTFILES ?= ~/dotfiles

build:
	$(DOTFILES)/init.sh
	@echo "OK."

install:
	ln -sf $(DOTFILES)/vim/vimrc ~/.vimrc
	ln -sf $(DOTFILES)/zsh/mac.env ~/.zshrc
	ln -sf $(DOTFILES)/tmux/tmux.conf ~/.tmux.conf
	@echo "OK."

install_ubuntu:
	ln -sf $(DOTFILES)/vim/vimrc-mini ~/.vimrc
	ln -sf $(DOTFILES)/zsh/linux.env ~/.zshrc
	ln -sf $(DOTFILES)/tmux/tmux.conf ~/.tmux.conf
	@echo "OK."

install_rpi:
	ln -sf $(DOTFILES)/vim/vimrc-mini ~/.vimrc
	ln -sf $(DOTFILES)/zsh/linux.env ~/.zshrc
	ln -sf $(DOTFILES)/tmux/tmux.conf ~/.tmux.conf
	@echo "OK."


python:
	$(DOTFILES)/python/install_python.sh
	@echo "OK."

tmux:
	$(DOTFILES)/tmux/install_tmux.sh
	@echo "OK."

zsh:
	$(DOTFILES)/zsh/install_zsh.sh
	@echo "OK."

vim:
	$(DOTFILES)/vim/install_vim.sh
	@echo "OK."

