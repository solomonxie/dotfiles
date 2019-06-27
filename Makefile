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
	ls ~/.config/nvim/init.vim
	ls ~/.tmux
	ls ~/.tmux.conf
	ls ~/.zsh
	ls ~/.zshrc
	ls ~/.tmux/resurrect/last

clean: checkhealth
	mv ~/.vim /tmp/vim-$(DT)
	mv ~/.vimrc /tmp/vimrc-$(DT)
	mv ~/.config/nvim/init.vim /tmp/init.vim-$(DT)
	mv ~/.tmux /tmp/tmux-$(DT)
	mv ~/.tmux.conf /tmp/tmux-$(DT).conf
	mv ~/.zsh /tmp/zsh-$(DT)
	mv ~/.zshrc /tmp/zshrc-$(DT)

install_mac: clean
	# VIM
	ln -s ${DOTFILES}/vim ~/.vim
	ln -sf ${DOTFILES}/vim/vimrc.vim ~/.vimrc
	ln -sf $(DOTFILES)/vim/init.vim ~/.config/nvim/init.vim
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
