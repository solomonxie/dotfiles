#! /usr/bin/env bash
#
# ENVIRONMENT: Ubuntu / Raspbian / MacOS
# NOTICE:
#   This script shouldn't be run as ROOT user,
#   please don't abuse "sudo" on top of this script.
#   Run this as ROOT results apps installed to wrong paths.
#
# How to run this script:
#   git clone https://github.com/solomonxie/dotfiles.git ~/dotfiles
#   ~/dotfiles/init.sh
#   #or
#   $ nohup ~/dotfiles/init.sh > /dev/null 2>&1 &
#
# Debugging:
#   $ bashdb ~/dotfiles/init.sh --os ubuntu
#   then:
#   type "s" to execute each line, type "n" for each top-level function

set -x

# Read environment variables
if [ ! -e /tmp/env-os -a -e /tmp/env-user ]; then
    echo "Please run './configure' before installment."
    exit 1;
else
    export MYOS=`cat /tmp/env-os`
    export USER=`cat /tmp/env-user`
fi


#-------------------------------------
#     Initialization Functions
#-------------------------------------

do_init_by_os(){
    # Do different script based on the OS
    case $MYOS in
        ubuntu)
            init_ubuntu ;;
        raspbian)
            init_rpi ;;
        mac)
            init_mac ;;
    esac
    export EDITOR=$(which vim)
    echo "[   CHANGE TIMEZONE   ]"
    sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime > /dev/null 2>&1
}


init_ubuntu(){
    echo "CURRENT Linux Distribution: [  Ubuntu  ]. Start initializing system funtionalities..."
    # Add uitility funcitons to bashrc
    #echo "[   ADDING UTILITY FUNCTIONS TO BASHRC   ]"
    #curl -sSL $REPO_URL//utils.sh -o ~/.bashrc.utils
    #cat ~/.bashrc.utils >> ~/.bash_profile
    #source ~/.bash_profile
    #
    echo "[   ADD CRON JOB TO PULL DOTFILES   ]"
    #echo "$(crontab -l)*/1 * * * * git -C ~/dotfiles pull" | crontab
    echo "*/1 * * * * git -C ~/dotfiles pull" | crontab
    # Update server & install essentials
    # echo "[   UPDATE APT REPOSITORIES   ]"
    echo "[   UPDATE APT REPOSITORIES   ]"
    # sudo cp ./etc/ubuntu/sources-cn.list /etc/apt/
    sudo apt-get update
    # Get essential tools before any installation
    echo "[   INSTALL ESSENTIAL SOFTWARES   ]"
    sudo apt-get install curl wget git bashdb -y
    # Setup Python3
    echo "[   INSTALL PYTHON   ]"
    $HOME/dotfiles//python/install_python.sh
    # Setup Vim
    echo "[   INSTALL VIM   ]"
    $HOME/dotfiles/vim/install_vim.sh
    # Setup Tmux
    echo "[   INSTALL TMUX   ]"
    $HOME/dotfiles/tmux/install_tmux.sh
    # Setup ZSH
    echo "[   INSTALL ZSH   ]"
    $HOME/dotfiles/zsh/install_zsh.sh
    # Install common used apt packages & clean up
    $HOME/dotfiles/pacMan/apt.sh
    # Install docker
    echo "[    SCRIPT FOR DOCKER   ]"
    $HOME/dotfiles/docker/install_docker.sh
    $HOME/dotfiles/docker/docker-apps.sh
}

init_rpi(){
    echo "CURRENT Linux Distribution: [  Raspbian  ]. Start initializing system funtionalities..."
    echo "[   Overwrite Raspberry Pi Default configs   ]"
    sudo cp ./etc/Rpi/config.txt /boot/config.txt
    # Enable ssh
    sudo touch /boot/ssh
    #
    # Setup WIFI (need you to rewrite wifi password in the file)
    #sudo wget $REPO_URL//Rpi/wpa_supplicant.conf -O /boot/wpa_supplicant.conf
    #
    # Add cron job to auto update dotfiles
    echo "*/1 * * * * git -C ~/dotfiles pull" | crontab
    #
    echo "[   UPDATE APT REPOSITORIES   ]"
    #sudo cp ./etc/Rpi/sources-cn-jessie.list /etc/apt/
    sudo apt-get update
    # Get essential tools before any installation
    sudo apt-get install curl wget git -y
    # Setup Python3
    echo "[   INSTALL INSTALL PYTHON3   ]"
    $HOME/dotfiles/python/install_python.sh
    # Setup Vim
    echo "[   INSTALL INSTALL VIM   ]"
    $HOME/dotfiles/vim/install_vim.sh
    # Setup Tmux
    echo "[   INSTALL INSTALL TMUX   ]"
    $HOME/dotfiles/tmux/install_tmux.sh
    # Setup ZSH
    echo "[   INSTALL INSTALL ZSH   ]"
    $HOME/dotfiles/zsh/install_zsh.sh
    # Install common used apt packages & clean up
    $HOME/dotfiles/pacman/apt.sh
    # Install docker
    echo "[    SCRIPT FOR DOCKER   ]"
    $HOME/dotfiles/docker/install-docker-rpi.sh
    $HOME/dotfiles/docker/docker-apps.sh
}

init_mac(){
    echo "CURRENT OS: [  Mac OS X  ]. Start initializing system funtionalities..."
    # Homebrew, always the 1st setup for Mac
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # Install bundles
    cd $HOME/dotfiles/pacman
    brew bundle install
    # Install Pip packages
    pip install --user -r $HOME/dotfiles/python/requirements-mac.txt
}




#-------------------------------------
#          Entry points
#-------------------------------------

# Run initial functions by os version
do_init_by_os "$@"  # 2>/tmp/init-error.log
