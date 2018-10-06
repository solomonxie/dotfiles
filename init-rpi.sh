#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Raspberry Pi (Raspbian)
# Notice: 
#    This script should be run by "$ sudo bash xxx.sh"
# How to run this script:
#    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/init-rpi.sh | sudo sh

# 
echo "--------------------[   Overwrite Raspberry Pi Default configs   ]---------------------"
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/Rpi/boot/config.txt -O /boot/config.txt
# Enable ssh
sudo touch /boot/ssh
# Setup WIFI (need you to rewrite wifi password in the file)
#sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/Rpi/wpa_supplicant.conf -O /boot/wpa_supplicant.conf


# Update server & install essentials
echo "--------------------[   INITIAL UPDATE OF UBUNTU   ]---------------------"
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/Rpi/sources.list -O /etc/apt/sources.list
yes | sudo apt-get update

# Setup Python3
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP PYTHON3   ]---------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/python/isntall_python3.sh | sudo sh

# Setup ZSH
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP ZSH   ]---------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/zsh/zsh-setup-rpi.sh | sudo sh

# Setup Vim
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP VIM   ]---------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/vim/vim-setup-rpi.sh | sudo sh

# Setup Tmux
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP TMUX   ]---------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/tmux/tmux-setup-rpi.sh | sudo sh


# Setup Webdav
#echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP Webdav   ]---------------------"
#curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/webdav/webdav-setup-rpi.sh | sudo sh



# Install Useful Programs
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR Installing common programs   ]---------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/etc/Rpi/common-programs-rpi.sh | sudo sh




# [THIS SECTION SHOULD BETTER BE PLACED AT THE BOTTOM]
echo "--------------------[   SET UP CRONTAB JOBS   ]---------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/etc/Rpi/crontab.txt |crontab

echo "--------------------[   Rewrite SYSTEM START commands with Shadowsocks   ]---------------------"
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/Rpi/rc.local -O /etc/rc.local



