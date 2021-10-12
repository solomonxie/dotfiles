#!make
-include envfile
-include envfile-local

DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`

install:
	@echo "make $(MYOS)" | sh


#=============================== MAC ===================================

mac: homebrew

homebrew:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew bundle
	brew bundle install --file $(DOTFILES)/pacman/Brewfile

change_source_brew:
	# brew.git:
	cd "$(brew --repo)"
	git remote set-url origin https://github.com/Homebrew/brew.git
	# homebrew-core.git:
	cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
	git remote set-url origin https://github.com/Homebrew/homebrew-core.git
	# # Change Back
	# brew.git:
	# cd "$(brew --repo)"
	# git remote set-url origin https://github.com/Homebrew/brew.git
	# # homebrew-core.git:
	# cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
	# git remote set-url origin https://github.com/Homebrew/homebrew-core.git


#=============================== DEBIAN ===================================

ubuntu:
	cat $(DOTFILES)/pacman/aptfile-raspbian.txt |xargs sudo apt-get install -y
	#sudo apt-get install fortune cowsay cmatrix -y

raspbian:
	cat $(DOTFILES)/pacman/aptfile-raspbian.txt |xargs sudo apt-get install -y
	#sudo apt-get install fortune cowsay cmatrix -y
	#sudo apt update && sudo apt install neofetch -y
	#sudo echo "deb [arch=all] http://dl.bintray.com/dawidd6/neofetch jessie main" > /etc/apt/sources.list.d/neofetch.list
	# Remove unused apps
	sudo apt-get remove --purge wolfram-engine -y
	sudo apt-get remove --purge libreoffice* -y
	sudo apt-get remove --purge texlive* -y

clean_debian:
	sudo apt-get autoremove -y
	sudo apt-get autoclean -y

clean_ubuntu: clean_debian
clean_raspbian: clean_debian

checkhealth_debian:
	apt-get --version

checkhealth_mac:
	brew --version


install_printer_debian: checkhealth_debian
	sudo apt-get install cups -y
	sudo usermod -aG lpadmin ${USER}
	sudo cupsctl --remote-any # Process to this url to manage printers:
	# https://ServerIP:631/

install_scanner_debian:
	sudo apt install sane -y
	# List all Scan devices with Names
	scanimage -L
	# Scan an image
	# scanimage -d "DeviceName" –-format=tiff > sample.tiff



#=============================== APK ===================================

apk:
	apk add curl wget unzip




#=============================== RPM ===================================



#=============================== PACMAN ===================================
