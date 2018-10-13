#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com


do_change_timezone(){
    echo "-----[   Change TIMEZONE   ]-----"
    sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
}

do_change_apt_source(){
    echo ""
}

do_install_docker_ubuntu(){
    echo "------[   DOWNLOADING SCRIPT FOR DOCKER   ]------"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/docker/install-docker-ubuntu.sh | sudo sh
}

do_install_docker_rpi(){
    echo "------[   DOWNLOADING SCRIPT FOR DOCKER   ]------"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/docker/install-docker-rpi.sh | sudo sh
}

do_install_python3(){
    echo "------[   DOWNLOADING SCRIPT FOR PYTHON3   ]-----"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/python/install_python3.sh | sudo sh
}

do_install_shadowsocks_ubuntu(){
    echo "-----[   DOWNLOADING SCRIPT FOR SHADOWSOCKS   ]-----"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/shadowsocks/ssserver-install-ubuntu.sh | sudo sh
}

do_install_v2ray_ubuntu(){
    echo "-----[   DOWNLOADING SCRIPT FOR V2RAY   ]-----"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/v2ray/install-v2ray-ubuntu.sh | sudo sh
}

do_install_zsh_ubuntu(){
    echo "-----[   DOWNLOADING SCRIPT FOR ZSH   ]-----"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/zsh/zsh-install-ubuntu.sh | sudo sh
}

do_install_vim_ubuntu(){
    echo "-----[   DOWNLOADING SCRIPT FOR VIM   ]-----"
    curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/vim/vim-install-ubuntu.sh | sudo sh
}



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





