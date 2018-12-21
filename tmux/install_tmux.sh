#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu / Raspbian / MacOS Sierra
#
# Commands:
#   1. Get in tmux
#   2. Install plugins: Ctrl-b + Ctrl-I
#   3. Reload configs: Ctrl-b + r
#   4. Resurrect: Ctrl-b + Ctrl-r
#
# Run:
#   $ ./install_tmux.sh --os ubuntu
# Debug:
#   $ bashdb ./install_tmux.sh --os ubuntu


set -x

# Setup env variables and shared functions
cd $(dirname $0); source "$(dirname $(pwd))/dotfiles.env"; cd -

#-------------------------------------
#     Installation Methods
#-------------------------------------

do_install_tmux(){
    # Do different things with different OS
    case $MYOS in
        ubuntu)
            install_tmux_ubuntu ;;
        raspbian)
            install_tmux_rpi ;;
        mac)
            install_tmux_mac ;;
    esac

    
    # Download & Install plugins
    echo "----------[  Installing TPM for Tmux   ]--------------"
    git clone https://github.com/tmux-plugins/tpm $HOUSE/.tmux/plugins/tpm
    $HOUSE/.tmux/plugins/tpm/bin/install_plugins
}

install_tmux_ubuntu(){
    yes | sudo apt-get install tmux

    # Make paths for tmux extensions
    mkdir -p $HOUSE/.tmux/resurrect
    echo "----------[  Overwrite .tmux.conf   ]--------------"
    cp $SRC/tmux/tmux.conf $HOUSE/.tmux.conf
    echo "----------[  Recover preset Tmux session   ]--------------"
    cp $SRC/tmux/resurrect/last-ubuntu.txt $HOUSE/.tmux/resurrect/last.txt
    ln -sf $HOUSE/.tmux/resurrect/last.txt $HOUSE/.tmux/resurrect/last
}

install_tmux_rpi(){
    yes | sudo apt-get install tmux

    # Make paths for tmux extensions
    mkdir -p $HOUSE/.tmux/resurrect
    echo "----------[  Overwrite .tmux.conf   ]--------------"
    cp $SRC/tmux/tmux.conf $HOUSE/.tmux.conf
    echo "----------[  Recover preset Tmux session   ]--------------"
    cp $SRC/tmux/resurrect/last-rpi.txt $HOUSE/.tmux/resurrect/last.txt
    ln -sf $HOUSE/.tmux/resurrect/last.txt $HOUSE/.tmux/resurrect/last
}

install_tmux_mac(){
    brew install tmux  

    # Make paths for tmux extensions
    mkdir -p $HOUSE/.tmux/resurrect
    echo "----------[  Overwrite .tmux.conf   ]--------------"
    cp $SRC/tmux/tmux.conf $HOUSE/.tmux.conf
    echo "----------[  Recover preset Tmux session   ]--------------"
    cp $SRC/tmux/resurrect/last-ubuntu.txt $HOUSE/.tmux/resurrect/last.txt
    ln -sf $HOUSE/.tmux/resurrect/last.txt $HOUSE/.tmux/resurrect/last
}




#-------------------------------------
#          Unit Tests
#-------------------------------------

do_test_installment(){
    if [ -e $HOUSE/.tmux ];then
        echo "[  OK  ]:----TMUX----"
    else
        echo "[  FAILED  ]:----TMUX----"
    fi
}



#-------------------------------------
#          Entry points
#-------------------------------------

do_install_tmux "$@"