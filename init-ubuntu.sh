#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# Notice: 
#    This script should be run by "$ sudo bash xxx.sh"
# How to run this script:
#    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/init-ubuntu.sh | sudo sh

sudo mkdir /var/log/init


# Change server timezone
echo "--------------------[   Change TIMEZONE   ]--------------------"
sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime >> /var/log/init/log_system_update.txt 1>&2

# Update server & install essentials
echo "--------------------[   INITIAL UPDATE OF UBUNTU   ]--------------------"
yes | sudo apt-get update >> /var/log/init/log_system_update.txt 1>&2

# Install docker
echo "--------------------[   DOWNLOADING SCRIPT FOR DOCKER   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/docker/docker-install-ubuntu.sh | sudo sh >> /var/log/init/log_docker.txt 1>&2

# Setup Python3
echo "--------------------[   DOWNLOADING SCRIPT FOR PYTHON3   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/python/python3-install-ubuntu.sh | sudo sh >> /var/log/init/log_python.txt 1>&2

# Setup Shadowsocks
echo "--------------------[   DOWNLOADING SCRIPT FOR SHADOWSOCKS   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/shadowsocks/ssserver-install-ubuntu.sh | sudo sh >> /var/log/init/log_shadowsocks.txt 1>&2

# Setup V2Ray
echo "--------------------[   DOWNLOADING SCRIPT FOR V2RAY   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/v2ray/install-v2ray-ubuntu.sh | sudo sh >> /var/log/init/log_shadowsocks.txt 1>&2


# Setup ZSH
echo "--------------------[   DOWNLOADING SCRIPT FOR ZSH   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/zsh/zsh-install-ubuntu.sh | sudo sh >> /var/log/init/log_zsh.txt 1>&2

# Setup Vim
echo "--------------------[   DOWNLOADING SCRIPT FOR VIM   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/vim/vim-install-ubuntu.sh | sudo sh >> /var/log/init/log_vim.txt 1>&2

# Setup Tmux
echo "--------------------[   DOWNLOADING SCRIPT FOR TMUX   ]--------------------"
curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/tmux/tmux-install-ubuntu.sh | sudo sh >> /var/log/init/log_tmux.txt 1>&2


# Install Useful Programs
echo "--------------------[   DOWNLOADING SCRIPT FOR Installing common programs   ]--------------------"
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/etc/common-programs-ubuntu.sh | sudo sh >> /var/log/init/log_common.txt 1>&2


# [THIS SECTION SHOULD BETTER BE PLACED AT THE BOTTOM]
echo "--------------------[   SET UP CRONTAB JOBS   ]--------------------"
sudo curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/etc/ubuntu/crontab.txt |crontab >> /var/log/init/log_crontab.txt 1>&2

echo "--------------------[   Rewrite SYSTEM START commands with Shadowsocks   ]--------------------"
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/etc/ubuntu/rc.local -O /etc/rc.local >> /var/log/init/log_rc_local.txt 1>&2





