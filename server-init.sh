#! /bin/bash # ---UBUNTU SERVER INITIAL SETUP---
# Notice: 
#    This script should be run by "$ sudo bash xxx.sh"


# Update server & install essentials
yes | sudo apt-get update
yes | sudo apt-get upgrade
yes | sudo apt-get install htop


# Setup Python3
sudo curl -L https://github.com/solomonxie/cdn/raw/master/python3-setup.sh | sh

# Setup Shadowsocks
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/shadowsocks-setup.sh | sh

# Setup ZSH
sudo curl -L https://github.com/solomonxie/cdn/raw/master/zsh/zsh-setup.sh | sh

# Setup Vim
sudo curl -L https://github.com/solomonxie/cdn/raw/master/vim/vim-setup.sh | sh

# Setup Tmux
sudo curl -L https://github.com/solomonxie/cdn/raw/master/tmux-setup.sh | sh




# Install Useful Programs
yes | sudo pip install -U youtube-dl you-get
yes | sudo pip install --user pipenv
