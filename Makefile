######################################################################
#           ____   ___ _____ _____ ___ _     _____ ____              #
#          |  _ \ / _ \_   _|  ___|_ _| |   | ____/ ___|             #
#          | | | | | | || | | |_   | || |   |  _| \___ \             #
#          | |_| | |_| || | |  _|  | || |___| |___ ___) |            #
#          |____/ \___/ |_| |_|   |___|_____|_____|____/             #
#                                                                    #
#       $ git clone https://github.com/solomonxie/dotfiles           #
#           $ cd dotfiles && make build && make install              #
######################################################################
.PHONY: config build install

DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`
DT ?= `date +%Y%m%d%s`


# Stage-1: Configure
config:
	./configure

# Step-2: Build
build: config
	echo "make ${MYOS}" | sh
	echo "Build Done. Please proceed to: $ make install."

# OS specific
mac: config build_mac build_python build_vim build_zsh build_tmux
	@echo "OK."
ubuntu: config build_ubuntu build_python build_tmux
	@echo "OK."

raspbian: config build_raspbian build_python build_tmux
	@echo "OK."


#################################################################################
#         _____ ____ ____  _____ _   _ _____ ___    _    _     ____             #
#        | ____/ ___/ ___|| ____| \ | |_   _|_ _|  / \  | |   / ___|            #
#        |  _| \___ \___ \|  _| |  \| | | |  | |  / _ \ | |   \___ \            #
#        | |___ ___) |__) | |___| |\  | | |  | | / ___ \| |___ ___) |           #
#        |_____|____/____/|_____|_| \_| |_| |___/_/   \_\_____|____/            #
#                                                                               #
#################################################################################
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

##################################################################
#            ____ ___  __  __ __  __  ___  _   _                 #
#           / ___/ _ \|  \/  |  \/  |/ _ \| \ | |                #
#          | |  | | | | |\/| | |\/| | | | |  \| |                #
#          | |__| |_| | |  | | |  | | |_| | |\  |                #
#           \____\___/|_|  |_|_|  |_|\___/|_| \_|                #
#                                                                #
#           _   _ _____ ___ _     ___ _____ ___ _____ ____       #
#          | | | |_   _|_ _| |   |_ _|_   _|_ _| ____/ ___|      #
#          | | | | | |  | || |    | |  | |  | ||  _| \___ \      #
#          | |_| | | |  | || |___ | |  | |  | || |___ ___) |     #
#           \___/  |_| |___|_____|___| |_| |___|_____|____/      #
#                                                                #
##################################################################
build_mac:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew bundle
	brew bundle install --file $(DOTFILES)/pacman/Brewfile

build_ubuntu:
	sudo apt-get update
	touch ~/.bashrc && echo "export LC_ALL=C" >> ~/.bashrc
	cat $(DOTFILES)/pacman/aptfile-raspbian.txt |xargs sudo apt-get install -y
	# Remove unused apps
	sudo apt-get autoremove -y
	sudo apt-get autoclean -y

build_raspbian:
	cat $(DOTFILES)/pacman/aptfile-raspbian.txt |xargs sudo apt-get install -y
	# Remove unused apps
	sudo apt-get remove --purge wolfram-engine -y
	sudo apt-get remove --purge libreoffice* -y
	sudo apt-get remove --purge texlive* -y
	sudo apt-get autoremove -y
	sudo apt-get autoclean -y

###########################################################
#     ______   ____  __ _     ___ _   _ _  ______         #
#    / ___\ \ / /  \/  | |   |_ _| \ | | |/ / ___|        #
#    \___ \\ V /| |\/| | |    | ||  \| | ' /\___ \        #
#     ___) || | | |  | | |___ | || |\  | . \ ___) |       #
#    |____/ |_| |_|  |_|_____|___|_| \_|_|\_\____/        #
#                                                         #
###########################################################
install: config
	echo "make install_${MYOS}" | sh
	echo "OK."

install_mac: install_zsh install_tmux install_vim
	@echo "OK."

install_ubuntu: install_tmux
	@echo "OK."

install_raspbian: install_tmux
	@echo "OK."

install_vim: config
	# Archive(Backup)
	# sudo cp -a ~/.vim{,_$(date +%F)}  # Does not support this in makefile
	mv ~/.vim ~/.vim_`date +%F` || True
	# Install symlinks
	ln -s ${DOTFILES}/vim ~/.vim
	ln -sf ${DOTFILES}/vim/vimrc.vim ~/.vimrc
	mkdir -p ~/.config/nvim || True
	ln -sf $(DOTFILES)/vim/ ~/.config/nvim/
	mkdir -p ~/.nvim || True
	ln -sf $(DOTFILES)/vim/vimrc.vim ~/.nvim/init.vim

install_zsh: config
	# Archive(Backup)
	mv ~/.zshrc ~/.zshrc_`date +%F` || True
	mv ~/.zsh ~/.zsh_`date +%F` || True
	# Install symlinks
	ln -s ${DOTFILES}/zsh ~/.zsh
	ln -sf ${DOTFILES}/zsh/env-${MYOS}.sh ~/.zshrc

install_tmux: config
	# Archive(Backup)
	mv ~/.tmux ~/.tmux_`date +%F` || True
	mv ~/.tmux.conf ~/.tmux.conf_`date +%F` || True
	# Install symlinks
	ln -s ${DOTFILES}/tmux ~/.tmux
	ln -sf ${DOTFILES}/tmux/tmux.conf ~/.tmux.conf
	ln -sf ${HOME}/.tmux/resurrect/last-${MYOS}.txt ${HOME}/.tmux/resurrect/last || True

install_git: config
	echo "[include]\n    path = ~/dotfiles/etc/git/gitconfig.ini" > ~/.gitconfig



# Stage-4: Backup
save:
	#mv ${DOTFILES}/tmux/resurrect/tmux_resurrect_20190525T173225.txt ${DOTFILES}/tmux/resurrect/last
	zip -r /tmp/mydotfiles.zip ~/
	mv /tmp/mydotfiles.zip ~/

