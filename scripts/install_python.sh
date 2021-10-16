#! /usr/bin/env bash
#
# Environment: Ubuntu / Raspbian
#

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
#     Installation Methods
#-------------------------------------

do_install_python(){
    # Do different things with different OS
    case $MYOS in
        ubuntu|raspbian)
            do_install_python3_deb ;;
        mac)
            do_install_python3_mac ;;
    esac
    echo "---[ Settingup virtual environments ]----"
    virtualenv -p python3 $HOME/virtualenv/venv3
    virtualenv -p python2 $HOME/virtualenv/venv2
    # Change source for pip to Chinese
    mkdir $HOME/.pip
    cp $HOME/myconf/dotfiles/python/pip.conf ~/.pip/
}


do_install_python3_deb(){
    sudo apt-get install python3 -y
    sudo apt-get install virtualenv -y
    # Install pip2 & pip3
    sudo apt-get install -y python-pip python3-pip
}

do_install_python3_mac(){
    brew install python3
    pip install virtualenv --user
    # Install pip3 & pip3
    curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
    sudo python2 /tmp/get-pip.py
    sudo python3 /tmp/get-pip.py
}




#-------------------------------------
#          Entry points
#-------------------------------------

do_install_python "$@"
