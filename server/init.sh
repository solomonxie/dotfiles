#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# Notice: 
#    This script should be run by "$ sudo bash xxx.sh"
# How to run this script:
#    sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/init.sh | sh

mkdir ~/.init
cd ~/.init

# Change server timezone
echo "--------------------[   Change TIMEZONE   ]--------------------"
sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime >> log_system_update.txt 2>&1

# Update server & install essentials
echo "--------------------[   INITIAL UPDATE OF UBUNTU   ]--------------------"
yes | sudo apt-get update >> log_system_update.txt 2>&1

# Setup Python3
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP PYTHON3   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/python3-setup.sh | sudo sh >> log_python.txt 2>&1

# Setup Shadowsocks
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP SHADOWSOCKS   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/shadowsocks/shadowsocks-setup.sh | sudo sh >> log_shadowsocks.txt 2>&1

# Setup ZSH
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP ZSH   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/zsh/zsh-setup.sh | sudo sh >> log_zsh.txt 2>&1

# Setup Vim
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP VIM   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/vim/vim-setup.sh | sudo sh >> log_vim.txt 2>&1

# Setup Tmux
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP TMUX   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/tmux/tmux-setup.sh | sudo sh >> log_tmux.txt 2>&1


# Install Useful Programs
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR Installing common programs   ]--------------------"
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/common-programs.sh | sudo sh >> log_common.txt 2>&1


# [THIS SECTION SHOULD BETTER BE PLACED AT THE BOTTOM]
echo "--------------------[   SET UP CRONTAB JOBS   ]--------------------"
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/server/crontab.txt |crontab >> log_crontab.txt 2>&1

echo "--------------------[   Rewrite SYSTEM START commands with Shadowsocks   ]--------------------"
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/server/rc.local -O /etc/rc.local >> log_rc_local.txt 2>&1





