
DOTFILES ?= ~/dotfiles

install:
	ln -sf $(DOTFILES)/vim/vimrc ~/.vimrc
	ln -sf $(DOTFILES)/zsh/mac.env ~/.zshrc
	ln -sf $(DOTFILES)/tmux/tmux.conf ~/.tmux.conf
	@echo "OK."

install_mac:
	install

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
