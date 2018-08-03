#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# Notice: 
#    This script should be run by "$ sudo bash xxx.sh"
# How to run this script:
#    $ sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/server-init.sh | sh


# Update server & install essentials
echo "========== (INITIAL UPDATE OF UBUNTU) ==========="
yes | sudo apt-get update
yes | sudo apt-get install htop


# Setup Python3
echo "========== (DOWNLOADING BASH SCRIPT FOR SETTING UP PYTHON3) ==========="
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/python3-setup.sh | sh

# Setup Shadowsocks
echo "========== (DOWNLOADING BASH SCRIPT FOR SETTING UP SHADOWSOCKS) ==========="
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/shadowsocks-setup.sh | sh

# Setup ZSH
echo "========== (DOWNLOADING BASH SCRIPT FOR SETTING UP ZSH) ==========="
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/zsh/zsh-setup.sh | sh

# Setup Vim
echo "========== (DOWNLOADING BASH SCRIPT FOR SETTING UP VIM) ==========="
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/vim/vim-setup.sh | sh

# Setup Tmux
echo "========== (DOWNLOADING BASH SCRIPT FOR SETTING UP TMUX) ==========="
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/tmux/tmux-setup.sh | sh



# Install Useful Programs
echo "========== (INSTALLING OFTEN USED PROGRAMS) ==========="
yes | sudo pip install -U youtube-dl you-get
yes | sudo pip install --user pipenv




# [THIS SECTION SHOULD BETTER BE PLACED AT THE BOTTOM]
#echo "========== (SET UP SYSTEM AUTO-START PROGRAMS) ==========="
#sudo mv /etc/rc.local /etc/rc-local-backup
#sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/rc.local -O /etc/rc.local
echo "========== (SET UP CRONTAB JOBS) ==========="
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/crontab.txt |crontab





