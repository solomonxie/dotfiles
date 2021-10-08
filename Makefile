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

# REF: https://skofgar.ch/dev/2020/08/how-to-quickly-replace-environment-variables-in-a-file/
# REF: https://pawamoy.github.io/posts/pass-makefile-args-as-typed-in-command-line/

.PHONY: build install
include envfile
include envfile-local

TARGET: build install

DT ?= `date +%Y%m%d%s`

test_env:
	@[ ! -z "${MYOS}" ] || exit 128
	@[ ! -z "${ME_USER}" ] || exit 128
	@[ ! -z "${DOTFILE_DIR}" ] || exit 128
	@echo "OK, ENV READY."

build: test_env
	echo "make ${MYOS}" | sh
	echo "Build Done. Please proceed to: $ make install."

# OS specific
mac: test_env build_mac build_python build_vim build_zsh build_tmux
	@echo "OK."

ubuntu: test_env build_ubuntu build_python build_tmux
	@echo "OK."

raspbian: build_raspbian build_python build_tmux
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
	sudo mv ${DOTFILE_DIR}/etc/samba/smb_share_definition.conf /etc/samba/smb.conf
	sudo service smbd restart
	sudo smbpasswd -a ${ME_USER}

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
	brew bundle install --file ${DOTFILE_DIR}/pacman/Brewfile

build_ubuntu:
	cat ${DOTFILE_DIR}/pacman/aptfile-raspbian.txt |xargs sudo apt-get install -y
	# Remove unused apps
	sudo apt-get autoremove -y
	sudo apt-get autoclean -y

build_raspbian:
	cat ${DOTFILE_DIR}/pacman/aptfile-raspbian.txt |xargs sudo apt-get install -y
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
install: test_env
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
	ln -sf  ${DOTFILE_DIR}/etc/tigrc .tigrc
	ln -sf  ${DOTFILE_DIR}/tmux .tmux
	ln -sf  ${DOTFILE_DIR}/tmux/tmux.conf .tmux.conf
	ln -sf  ${DOTFILE_DIR}/vim .vim
	ln -sf  ${DOTFILE_DIR}/vim/vimrc-mini.vim .vimrc
	ln -sf  ${DOTFILE_DIR}/zsh .zsh
	ln -sf  ${DOTFILE_DIR}/zsh/zshrc-mac.sh .zshrc
	ln -sf  ~/myconf/local .local
	ln -sf  ~/myconf/ssh .ssh
	ln -sf  ~/myconf/zsh_history .zsh_history
	# VIM
	ln -sf ${DOTFILE_DIR}/vim/ ~/.vim/
	ln -sf ${DOTFILE_DIR}/vim/vimrc.vim ~/.vimrc
	ln -sf ${DOTFILE_DIR}/vim/ ~/.config/nvim/
	ln -sf ${DOTFILE_DIR}/vim/vimrc.vim ~/.nvim/init.vim
	# ZSH
	ln -sf ${DOTFILE_DIR}/zsh ~/.zsh
	ln -sf ${DOTFILE_DIR}/zsh/env-${MYOS}.sh ~/.zshrc
	ln -sf ${DOTFILE_DIR}/zsh/bashrc.sh ~/.bashrc
	# TMUX
	ln -s ${DOTFILE_DIR}/tmux ~/.tmux
	ln -sf ${DOTFILE_DIR}/tmux/tmux.conf ~/.tmux.conf
	ln -sf ${HOME}/.tmux/resurrect/last-${MYOS}.txt ${HOME}/.tmux/resurrect/last || true
	@echo "OK."

install_raspbian:
	echo "1 * * * * git -C /home/${ME_USER}/myconf/dotfiles/ pull origin master" |crontab ||true
	@echo "OK."

install_git:
	echo "[include]\n    path = ${DOTFILE_DIR}/etc/git/gitconfig.ini" > ~/.gitconfig


# Stage-4: Backup
save:
	#mv ${DOTFILE_DIR}/tmux/resurrect/tmux_resurrect_20190525T173225.txt ${DOTFILE_DIR}/tmux/resurrect/last
	zip -r /tmp/mydotfiles.zip ~/
	mv /tmp/mydotfiles.zip ~/



#######################################################################
#                        PERFORMANCE PROFILING                        #
#######################################################################
vim-perf:
	python ./vim/vim-profiler/vim-profiler.py nvim
