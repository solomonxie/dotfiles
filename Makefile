# git clone https://github.com/solomonxie/dotfiles
.PHONY: config build_python build_tmux build_zsh build_vim build_docker install

DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`
DT ?= `date +%Y%m%d%s`


# Stage-1: Configure
config:
	./configure

# Step-2: Build
build: config
	echo "make build_${MYOS}" | sh
	echo "Build Done. Please proceed to: $ make install."

build_mac: config build_python build_vim build_zsh build_tmux
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@echo "OK."
build_ubuntu: build_python build_tmux
	@echo "OK."
build_raspbian: build_python build_vim build_zsh build_tmux
	@echo "OK."

build_python:
	cd python && $(MAKE) ${MYOS}
	echo "OK."

build_tmux:
	cd tmux && $(MAKE) ${MYOS}
	cd tmux && $(MAKE) plugins
	echo "OK."

build_zsh:
	cd zsh && $(MAKE) ${MYOS}
	cd zsh && $(MAKE) plugins
	echo "OK."

build_vim:
	cd vim && $(MAKE) ${MYOS}
	vim +PlugInstall +qall
	echo "OK."

build_docker:
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
	ln -sf ${DOTFILES}/zsh/env-${MYOS}.sh ~/.zshrc

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

