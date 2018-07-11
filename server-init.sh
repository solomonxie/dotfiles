#! /bin/bash # ---UBUNTU SERVER INITIAL SETUP---
# Notice: 
#    This script should be run by "$ sudo bash xxx.sh"
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu

# Update server & install essentials
echo "========== (INITIAL UPDATE OF UBUNTU) ==========="
yes | sudo apt-get update
yes | sudo apt-get upgrade
yes | sudo apt-get install htop


# Setup Python3
echo "========== (DOWNLOADING BASH SCRIPT FOR SETTING UP PYTHON3) ==========="
sudo curl -L https://github.com/solomonxie/cdn/raw/master/python3-setup.sh | sh

# Setup Shadowsocks
echo "========== (DOWNLOADING BASH SCRIPT FOR SETTING UP SHADOWSOCKS) ==========="
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/shadowsocks-setup.sh | sh

# Setup ZSH
echo "========== (DOWNLOADING BASH SCRIPT FOR SETTING UP ZSH) ==========="
sudo curl -L https://github.com/solomonxie/cdn/raw/master/zsh/zsh-setup.sh | sh

# Setup Vim
echo "========== (DOWNLOADING BASH SCRIPT FOR SETTING UP VIM) ==========="
sudo curl -L https://github.com/solomonxie/cdn/raw/master/vim/vim-setup.sh | sh

# Setup Tmux
echo "========== (DOWNLOADING BASH SCRIPT FOR SETTING UP TMUX) ==========="
sudo curl -L https://github.com/solomonxie/cdn/raw/master/tmux-setup.sh | sh



# Install Useful Programs
echo "========== (INSTALLING OFTEN USED PROGRAMS) ==========="
yes | sudo pip install -U youtube-dl you-get
yes | sudo pip install --user pipenv
