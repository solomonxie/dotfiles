.PHONY: configure-it build-python build-tmux build-zsh build-vim build-docker install

DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`
DT ?= `date +%Y%m%d%s`


# Stage-1: Configure
configure-it:
	./configure

# Step-2: Build
build: configure-it
	echo "make build_${MYOS}" | sh
	echo "Build Done. Please proceed to: $ make install."

build_mac: configure-it build-python build-vim build-zsh build-tmux
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@echo "OK."
build_ubuntu: build-python build-vim build-zsh build-tmux build-docker
	@echo "OK."
build_raspbian: build-python build-vim build-zsh build-tmux build-docker
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
	cd docker && $(MAKE) install
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
	mv ~/.gitconfig /tmp/gitconfig-$(DT) || echo


# Step-3: Install symlinks
install:
	echo "make install_symlinks_${MYOS}" | sh
	echo "OK."

install_symlinks_mac: clean install_symlinks_vim install_symlinks_zsh install_symlinks_tmux install_symlinks_git checkhealth
	@echo "OK."

install_symlinks_ubuntu: clean install_symlinks_vim install_symlinks_zsh install_symlinks_tmux install_symlinks_git checkhealth
	@echo "OK."

install_symlinks_raspbian: clean install_symlinks_vim install_symlinks_zsh install_symlinks_tmux install_symlinks_git checkhealth
	@echo "OK."

install_symlinks_vim:
	ln -s ${DOTFILES}/vim ~/.vim
	ln -sf ${DOTFILES}/vim/vimrc.vim ~/.vimrc
	mkdir -p ~/.config/nvim || echo
	ln -sf $(DOTFILES)/vim/ ~/.config/nvim/
	mkdir -p ~/.nvim || echo
	ln -sf $(DOTFILES)/vim/vimrc.vim ~/.nvim/init.vim

install_symlinks_zsh:
	ln -s ${DOTFILES}/zsh ~/.zsh
	ln -sf ${DOTFILES}/zsh/${MYOS}.env ~/.zshrc

install_symlinks_tmux:
	ln -s ${DOTFILES}/tmux ~/.tmux
	ln -sf ${DOTFILES}/tmux/tmux.conf ~/.tmux.conf
	ln -sf ${HOME}/.tmux/resurrect/last-${MYOS}.txt ${HOME}/.tmux/resurrect/last

install_symlinks_git:
	echo "[include]\n    path = ~/dotfiles/etc/git/gitconfig.ini" > ~/.gitconfig



# Stage-4: Backup
save:
	#mv ${DOTFILES}/tmux/resurrect/tmux_resurrect_20190525T173225.txt ${DOTFILES}/tmux/resurrect/last
	zip -r /tmp/mydotfiles.zip ~/
	mv /tmp/mydotfiles.zip ~/

