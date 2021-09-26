######################################################################
#           ____   ___ _____ _____ ___ _     _____ ____              #
#          |  _ \ / _ \_   _|  ___|_ _| |   | ____/ ___|             #
#          | | | | | | || | | |_   | || |   |  _| \___ \             #
#          | |_| | |_| || | |  _|  | || |___| |___ ___) |            #
#          |____/ \___/ |_| |_|   |___|_____|_____|____/             #
#                                                                    #
#       $ git clone https://github.com/solomonxie/dotfiles           #
#           $ cd myconf/dotfiles && make build && make install              #
######################################################################
.PHONY: config build install

# REF: https://pawamoy.github.io/posts/pass-makefile-args-as-typed-in-command-line/

DOTFILES ?= ~/myconf/dotfiles
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
	cd python && $(MAKE) venv
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

build_ubuntu_samba:
	# Refer to: https://ubuntu.com/tutorials/install-and-configure-samba#1-overview
	sudo apt install samba -y ||true
	mkdir ~/sambashare/ ||true
	sudo mv ~/myconf/dotfiles/etc/samba/smb_share_definition.conf /etc/samba/smb.conf
	sudo service smbd restart
	sudo smbpasswd -a ${USER}

build_ubuntu_remote_desktop:
	sudo apt-get install xrdp -y
	sudo sed -e 's/^new_cursors=true/new_cursors=false/g' -i /etc/xrdp/xrdp.ini
	sudo systemctl restart xrdp

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
	brew bundle install --file ~/myconf/dotfiles/pacman/Brewfile

build_ubuntu:
	cat ~/myconf/dotfiles/pacman/aptfile-raspbian.txt |xargs sudo apt-get install -y
	# Remove unused apps
	sudo apt-get autoremove -y
	sudo apt-get autoclean -y

build_raspbian:
	cat ~/myconf/dotfiles/pacman/aptfile-raspbian.txt |xargs sudo apt-get install -y
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

install_mac:
	# Archive(Backup)
	# sudo cp -a ~/.vim{,_$(date +%F)}  # Does not support this in makefile
	mkdir ~/.vim ||true
	mv ~/.vim ~/.vim_`date +%F` || true
	mkdir -p ~/.config/nvim ||true
	mkdir -p ~/.nvim ||true
	mv ~/.zshrc ~/.zshrc_`date +%F` || true
	mv ~/.zsh ~/.zsh_`date +%F` || true
	mv ~/.tmux ~/.tmux_`date +%F` || true
	mv ~/.tmux.conf ~/.tmux.conf_`date +%F` || true
	# SYMBLINKS
	ln -sf  ~/.config/gitconfig .gitconfig
	ln -sf  ~/.config/iterm2 .iterm2
	ln -sf  ~/.config/iterm2_shell_integration.zsh .iterm2_shell_integration.zsh
	ln -sf  ~/.config/minio .minio
	ln -sf  ~/.config/postman .postman
	ln -sf  ~/.config/sh_history .sh_history
	ln -sf  ~/myconf/aws .aws
	ln -sf  ~/myconf/config .config
	ln -sf  ~/myconf/config/fiddler .fiddler
	ln -sf  ~/myconf/config/fzf.bash .fzf.bash
	ln -sf  ~/myconf/config/fzf.zsh .fzf.zsh
	ln -sf  ~/myconf/dotfiles/etc/tigrc .tigrc
	ln -sf  ~/myconf/dotfiles/tmux .tmux
	ln -sf  ~/myconf/dotfiles/tmux/tmux.conf .tmux.conf
	ln -sf  ~/myconf/dotfiles/vim .vim
	ln -sf  ~/myconf/dotfiles/vim/vimrc-mini.vim .vimrc
	ln -sf  ~/myconf/dotfiles/zsh .zsh
	ln -sf  ~/myconf/dotfiles/zsh/zshrc-mac.sh .zshrc
	ln -sf  ~/myconf/local .local
	ln -sf  ~/myconf/ssh .ssh
	ln -sf  ~/myconf/zsh_history .zsh_history
	# VIM
	ln -sf ~/myconf/dotfiles/vim/ ~/.vim/
	ln -sf ~/myconf/dotfiles/vim/vimrc.vim ~/.vimrc
	ln -sf ~/myconf/dotfiles/vim/ ~/.config/nvim/
	ln -sf ~/myconf/dotfiles/vim/vimrc.vim ~/.nvim/init.vim
	# ZSH
	ln -sf ~/myconf/dotfiles/zsh ~/.zsh
	ln -sf ~/myconf/dotfiles/zsh/env-${MYOS}.sh ~/.zshrc
	ln -sf ~/myconf/dotfiles/zsh/bashrc.sh ~/.bashrc
	# TMUX
	ln -s ~/myconf/dotfiles/tmux ~/.tmux
	ln -sf ~/myconf/dotfiles/tmux/tmux.conf ~/.tmux.conf
	ln -sf ${HOME}/.tmux/resurrect/last-${MYOS}.txt ${HOME}/.tmux/resurrect/last || true

	@echo "OK."

install_raspbian:
	echo "1 * * * * git -C /home/${USER}/myconf/dotfiles/ pull origin master" |crontab ||true
	@echo "OK."

install_git: config
	echo "[include]\n    path = ~/myconf/dotfiles/etc/git/gitconfig.ini" > ~/.gitconfig


# Stage-4: Backup
save:
	#mv ~/myconf/dotfiles/tmux/resurrect/tmux_resurrect_20190525T173225.txt ~/myconf/dotfiles/tmux/resurrect/last
	zip -r /tmp/mydotfiles.zip ~/
	mv /tmp/mydotfiles.zip ~/



#######################################################################
#                        PERFORMANCE PROFILING                        #
#######################################################################
vim-perf:
	python ./vim/vim-profiler/vim-profiler.py nvim
