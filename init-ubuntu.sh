#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# Notice: 
#    This script should be run by "$ sudo bash xxx.sh"
# How to run this script:
#    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/init-ubuntu.sh | sudo sh

mkdir ~/.init

# Change server timezone
echo "--------------------[   Change TIMEZONE   ]--------------------"
sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime >> ~/.init/log_system_update.txt 1>&2

# Update server & install essentials
echo "--------------------[   INITIAL UPDATE OF UBUNTU   ]--------------------"
yes | sudo apt-get update >> ~/.init/log_system_update.txt 1>&2

# Setup Python3
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP PYTHON3   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/python/python3-install-ubuntu.sh | sudo sh >> ~/.init/log_python.txt 1>&2

# Setup Shadowsocks
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP SHADOWSOCKS   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/shadowsocks/ssserver-install-ubuntu.sh | sudo sh >> ~/.init/log_shadowsocks.txt 1>&2

# Setup ZSH
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP ZSH   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/zsh/zsh-install-ubuntu.sh | sudo sh >> ~/.init/log_zsh.txt 1>&2

# Setup Vim
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP VIM   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/vim/vim-install-ubuntu.sh | sudo sh >> ~/.init/log_vim.txt 1>&2

# Setup Tmux
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR SETTING UP TMUX   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/tmux/tmux-install-ubuntu.sh | sudo sh >> ~/.init/log_tmux.txt 1>&2


# Install Useful Programs
echo "--------------------[   DOWNLOADING BASH SCRIPT FOR Installing common programs   ]--------------------"
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/etc/common-programs-ubuntu.sh | sudo sh >> ~/.init/log_common.txt 1>&2


# [THIS SECTION SHOULD BETTER BE PLACED AT THE BOTTOM]
echo "--------------------[   SET UP CRONTAB JOBS   ]--------------------"
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/etc/ubuntu/crontab.txt |crontab >> ~/.init/log_crontab.txt 1>&2

echo "--------------------[   Rewrite SYSTEM START commands with Shadowsocks   ]--------------------"
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/ubuntu/rc.local -O /etc/rc.local >> ~/.init/log_rc_local.txt 1>&2





