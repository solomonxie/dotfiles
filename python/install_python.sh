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
        ubuntu|raspbian)
            install_tmux_ubuntu ;;
        mac)
            install_tmux_mac ;;
    esac
    echo "---[ Settingup virtual environments ]----"
    virtualenv -p python3 $HOME/virtualenv/venv3
    # Change source for pip to Chinese
    mkdir $HOME/.pip
    cp $HOME/dotfiles/python/pip.conf ~/.pip/
}


do_install_python3_deb(){
    sudo apt-get install python3 -y
    # Install pip2 & pip3
    sudo apt-get install -y python-pip python3-pip
    # Install Virtualenv
    sudo apt-get install -y virtualenv
}

do_install_python3_mac(){
    brew install python3
    # Install pip3 & pip3
    curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
    sudo python2 /tmp/get-pip.py
    sudo python3 /tmp/get-pip.py
}




#-------------------------------------
#          Entry points
#-------------------------------------

do_install_python "$@"
