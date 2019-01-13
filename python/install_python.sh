#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Environment: Ubuntu / Raspbian
#

set -x

# Setup env variables and shared functions
cd $(dirname $0); source "$(dirname $(pwd))/dotfiles.env"; cd -

#-------------------------------------
#     Installation Methods
#-------------------------------------

do_install_python(){
    # Do different things with different OS
    case $MYOS in
        ubuntu)
            install_tmux_ubuntu ;;
        raspbian)
            install_tmux_rpi ;;
        mac)
            install_tmux_mac ;;
    esac
    # Install pip / Virtualenv
    do_install_pip
    do_install_virtualenv
}


do_install_python3_ubuntu(){
    sudo apt-get install python3 -y
}

do_install_python3_rpi(){
    sudo apt-get install python3 -y
}

do_install_python3_mac(){
    brew install python3 
}


do_install_pip(){
    echo "----[ Installing pip ]-----"
    python3 /tmp/get-pip.py --user

    echo "----[ Upgrading pip ]-----"
    pip install --upgrade pip

    # Change source for pip to Chinese
    mkdir $HOME/.pip
    cp $HOME/dotfiles/python/pip.conf ~/.pip/
}

do_install_virtualenv(){
    echo "----[ Installing virtualenv ]----"
    pip install --user virtualenv

    # ---- Make venvs ----
    echo "---[ Settingup virtual environments ]----"
    virtualenv -p python3 $HOME/virtualenv/venv3
}




#-------------------------------------
#          Entry points
#-------------------------------------

do_install_python "$@"
