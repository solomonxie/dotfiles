#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Raspberry Pi (Raspbian)
# Notice: 
#    This script should be run by "$ sudo bash xxx.sh"
# How to run this script:
#    $ sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/init.sh | sh

# 
echo "========== (Overwrite Raspberry Pi Default configs) ==========="
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/config.txt -O /boot/config.txt
# Enable ssh
sudo touch /boot/ssh
# Setup WIFI
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/wpa_supplicant.conf -O /boot/wpa_supplicant.conf


# Update server & install essentials
echo "========== (INITIAL UPDATE OF UBUNTU) ==========="
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/sources.list -O /etc/apt/sources.list
yes | sudo apt-get update

# Setup Python3
echo "========== (DOWNLOADING BASH SCRIPT FOR SETTING UP PYTHON3) ==========="
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/python3-setup.sh | sh

# Setup ZSH
echo "========== (DOWNLOADING BASH SCRIPT FOR SETTING UP ZSH) ==========="
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/zsh/zsh-setup.sh | sh

# Setup Vim
echo "========== (DOWNLOADING BASH SCRIPT FOR SETTING UP VIM) ==========="
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/vim/vim-setup.sh | sh

# Setup Tmux
echo "========== (DOWNLOADING BASH SCRIPT FOR SETTING UP TMUX) ==========="
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/tmux/tmux-setup.sh | sh


# Setup Webdav
echo "========== (DOWNLOADING BASH SCRIPT FOR SETTING UP Webdav) ==========="
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/webdav/webdav-setup.sh | sh



# Install Useful Programs
echo "========== (DOWNLOADING BASH SCRIPT FOR Installing common programs) ==========="
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/common-programs.sh | sh




# [THIS SECTION SHOULD BETTER BE PLACED AT THE BOTTOM]
echo "========== (SET UP CRONTAB JOBS) ==========="
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/crontab.txt |crontab

echo "========== (Rewrite SYSTEM START commands with Shadowsocks) ==========="
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/rc.local -O /etc/rc.local



