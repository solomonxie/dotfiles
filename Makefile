.PHONY: configure-it python-it tmux-it zsh-it vim-it docker-it install

DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`
DT ?= `date +%Y%m%d%s`

install:
	@echo "Installing for [${MYOS}] now...."
	@echo "make install_${MYOS}" | sh
	@echo "OK."

configure-it:
	./configure

mac:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

save:
	#mv ${DOTFILES}/tmux/resurrect/tmux_resurrect_20190525T173225.txt ${DOTFILES}/tmux/resurrect/last
	zip -r /tmp/mydotfiles.zip ~/
	mv /tmp/mydotfiles.zip ~/

python-it:
	@cd python && $(MAKE) ${MYOS}
	@echo "OK."

tmux-it:
	@cd tmux && $(MAKE) ${MYOS}
	@cd tmux && $(MAKE) plugins
	@echo "OK."

zsh-it:
	@cd zsh && $(MAKE) ${MYOS}
	@cd zsh && $(MAKE) plugins
	@echo "OK."

vim-it:
	@cd vim && $(MAKE) ${MYOS}
	vim +PlugInstall +qall
	@echo "OK."

docker-it:
	@cd docker && $(MAKE) ${MYOS}
	@cd docker && $(MAKE) apps_${MYOS}
	@echo "OK."


checkhealth:
	ls ~/.vim
	ls ~/.vimrc
	ls ~/.tmux
	ls ~/.tmux.conf
	ls ~/.zsh
	ls ~/.zshrc
	ls ~/.tmux/resurrect/last

checkdependencies:
	ls ~/.vim
	ls ~/.tmux

clean:
	mv ~/.vim /tmp/vim-$(DT) || 1
	mv ~/.vimrc /tmp/vimrc-$(DT) || 1
	mv ~/.config/nvim/init.vim /tmp/init.vim-$(DT) || 1
	mv ~/.tmux /tmp/tmux-$(DT) || 1
	mv ~/.tmux.conf /tmp/tmux-$(DT).conf || 1
	mv ~/.zsh /tmp/zsh-$(DT) || 1
	mv ~/.zshrc /tmp/zshrc-$(DT) || 1

install_mac: clean
	# VIM
	ln -s ${DOTFILES}/vim ~/.vim
	ln -sf ${DOTFILES}/vim/vimrc.vim ~/.vimrc
	mkdir -p ~/.config/nvim/ ~/.nvim/
	ln -sf $(DOTFILES)/vim/vimrc.vim ~/.config/nvim/init.vim
	ln -sf $(DOTFILES)/vim/vimrc.vim ~/.nvim/init.vim
	# ZSH
	ln -s ${DOTFILES}/zsh ~/.zsh
	ln -sf ${DOTFILES}/zsh/mac.env ~/.zshrc
	# TMUX
	ln -s ${DOTFILES}/tmux ~/.tmux
	ln -sf ${DOTFILES}/tmux/tmux.conf ~/.tmux.conf
	ln -sf ${HOME}/.tmux/resurrect/last-mac.txt ${HOME}/.tmux/resurrect/last
	@echo "OK."

install_ubuntu: clean
	# VIM
	ln -s ${DOTFILES}/vim ~/.vim
	ln -sf ${DOTFILES}/vim/vimrc-mini.vim ~/.vimrc
	ln -sf ${DOTFILES}/vim/vimrc-mini.vim ~/.config/nvim/init.vim
	# ZSH
	ln -s ${DOTFILES}/zsh ~/.zsh
	ln -sf ${DOTFILES}/zsh/linux.env ~/.zshrc
	# TMU
	ln -s ${DOTFILES}/tmux ~/.tmux
	ln -sf ${DOTFILES}/tmux/tmux.conf ~/.tmux.conf
	ln -sf ${HOME}/.tmux/resurrect/last-ubuntu.txt ${HOME}/.tmux/resurrect/last
	@echo "OK."

install_raspbian: clean
	# VIM
	ln -s ${DOTFILES}/vim ~/.vim
	ln -sf ${DOTFILES}/vim/vimrc-mini.vim ~/.vimrc
	ln -sf ${DOTFILES}/vim/vimrc-mini.vim ~/.config/nvim/init.vim
	# ZSH
	ln -s ${DOTFILES}/zsh ~/.zsh
	ln -sf ${DOTFILES}/zsh/linux.env ~/.zshrc
	# TMUX
	ln -s ${DOTFILES}/tmux ~/.tmux
	ln -sf ${DOTFILES}/tmux/tmux.conf ~/.tmux.conf
	ln -sf ${HOME}/.tmux/resurrect/last-raspbian.txt ${HOME}/.tmux/resurrect/last
	@echo "OK."
