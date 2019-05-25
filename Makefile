.PHONY: build

DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`
DT ?= `date +%Y%m%d%s`

install: configure-it
	@echo "Installing for [$(MYOS)] now...."
	@echo "make install_$(MYOS)" | sh
	@echo "OK."

configure-it:
	@configure

build: python-it tmux-it zsh-it vim-it install

save:
	#mv $(DOTFILES)/tmux/resurrect/tmux_resurrect_20190525T173225.txt $(DOTFILES)/tmux/resurrect/last

python-it:
	echo "make install $(MYOS) -f $(DOTFILES)/python/Makefile" | sh
	@echo "OK."

tmux-it:
	echo "make install $(MYOS) -f $(DOTFILES)/tmux/Makefile" | sh
	@echo "OK."

zsh-it:
	echo "make install $(MYOS) -f $(DOTFILES)/zsh/Makefile" | sh
	@echo "OK."

vim-it:
	echo "make install $(MYOS) -f $(DOTFILES)/vim/Makefile" | sh
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
	ln -sf $(DOTFILES)/tmux/tmux.conf ~/.tmux.conf
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
	ln -sf $(DOTFILES)/tmux/tmux.conf ~/.tmux.conf
	ln -sf $(HOME)/.tmux/resurrect/last-raspbian.txt $(HOME)/.tmux/resurrect/last
	@echo "OK."
