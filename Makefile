.PHONY: configure-it build-python build-tmux build-zsh build-vim build-docker install

DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`
DT ?= `date +%Y%m%d%s`


# Stage-1: Configure
configure-it:
	./configure

# Step-2: Build
install: configure-it
	echo "make install_${MYOS}" | sh
	echo "make install_symlinks_${MYOS}" | sh
	echo "OK."

install_mac: configure-it build-python build-vim build-zsh build-tmux
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@echo "OK."
install_ubuntu: configure-it build-python build-vim build-zsh build-tmux build-docker
	@echo "OK."
install_raspbian: configure-it build-python build-vim build-zsh build-tmux build-docker
	@echo "OK."

build-python:
	cd python && $(MAKE) ${MYOS}
	echo "OK."

build-tmux:
	cd tmux && $(MAKE) ${MYOS}
	cd tmux && $(MAKE) plugins
	echo "OK."

build-zsh:
	cd zsh && $(MAKE) ${MYOS}
	cd zsh && $(MAKE) plugins
	echo "OK."

build-vim:
	cd vim && $(MAKE) ${MYOS}
	vim +PlugInstall +qall
	echo "OK."

build-docker:
	cd docker && $(MAKE) ${MYOS}
	cd docker && $(MAKE) apps_${MYOS}
	echo "OK."


checkhealth:
	ls ~/.vim
	ls ~/.config/nvim
	ls ~/.vimrc
	ls ~/.tmux
	ls ~/.tmux.conf
	ls ~/.zsh
	ls ~/.zshrc
	ls ~/.tmux/resurrect/last

clean:
	mv ~/.vim /tmp/vim-$(DT) || echo
	mv ~/.vimrc /tmp/vimrc-$(DT) || echo
	mv ~/.config/nvim /tmp/nvim-$(DT) || echo
	mv ~/.tmux /tmp/tmux-$(DT) || echo
	mv ~/.tmux.conf /tmp/tmux-$(DT).conf || echo
	mv ~/.zsh /tmp/zsh-$(DT) || echo
	mv ~/.zshrc /tmp/zshrc-$(DT) || echo

#
# Stage-3: Install Symlinks
install_symlinks_mac: checkhealth clean install_symlinks_vim install_symlinks_zsh install_symlinks_tmux
	@echo "OK."

install_symlinks_ubuntu: checkhealth clean install_symlinks_vim install_symlinks_zsh install_symlinks_tmux
	@echo "OK."

install_symlinks_raspbian: checkhealth clean install_symlinks_vim install_symlinks_zsh install_symlinks_tmux
	@echo "OK."

install_symlinks_vim:
	ln -s ${DOTFILES}/vim ~/.vim
	ln -sf ${DOTFILES}/vim/vimrc.vim ~/.vimrc
	ln -sf $(DOTFILES)/vim/ ~/.config/nvim/
	ln -sf $(DOTFILES)/vim/vimrc.vim ~/.nvim/init.vim

install_symlinks_zsh:
	ln -s ${DOTFILES}/zsh ~/.zsh
	ln -sf ${DOTFILES}/zsh/mac.env ~/.zshrc

install_symlinks_tmux:
	ln -s ${DOTFILES}/tmux ~/.tmux
	ln -sf ${DOTFILES}/tmux/tmux.conf ~/.tmux.conf
	ln -sf ${HOME}/.tmux/resurrect/last-mac.txt ${HOME}/.tmux/resurrect/last

install_symlinks_git:
	ln -sf $(DOTFILES)/etc/gitconfig ~/.gitconfig


# Stage-4: Backup
save:
	#mv ${DOTFILES}/tmux/resurrect/tmux_resurrect_20190525T173225.txt ${DOTFILES}/tmux/resurrect/last
	zip -r /tmp/mydotfiles.zip ~/
	mv /tmp/mydotfiles.zip ~/

