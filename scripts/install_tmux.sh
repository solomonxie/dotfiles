#! /usr/bin/env bash
#
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
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    $HOME/.tmux/plugins/tpm/bin/install_plugins
}

install_tmux_ubuntu(){
    yes | sudo apt-get install tmux

    # Make paths for tmux extensions
    mkdir -p $HOME/.tmux/resurrect
    echo "----------[  Overwrite .tmux.conf   ]--------------"
    cp $HOME/myconf/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
    echo "----------[  Recover preset Tmux session   ]--------------"
    cp $HOME/myconf/dotfiles/tmux/resurrect/last-ubuntu.txt $HOME/.tmux/resurrect/last.txt
    ln -sf $HOME/.tmux/resurrect/last.txt $HOME/.tmux/resurrect/last
}

install_tmux_rpi(){
    yes | sudo apt-get install tmux

    # Make paths for tmux extensions
    mkdir -p $HOME/.tmux/resurrect
    echo "----------[  Overwrite .tmux.conf   ]--------------"
    cp $HOME/myconf/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
    echo "----------[  Recover preset Tmux session   ]--------------"
    cp $HOME/myconf/dotfiles/tmux/resurrect/last-rpi.txt $HOME/.tmux/resurrect/last.txt
    ln -sf $HOME/.tmux/resurrect/last.txt $HOME/.tmux/resurrect/last
}

install_tmux_mac(){
    brew install tmux

    # Make paths for tmux extensions
    mkdir -p $HOME/.tmux/resurrect
    echo "----------[  Overwrite .tmux.conf   ]--------------"
    cp $HOME/myconf/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
    echo "----------[  Recover preset Tmux session   ]--------------"
    cp $HOME/myconf/dotfiles/tmux/resurrect/last-ubuntu.txt $HOME/.tmux/resurrect/last.txt
    ln -sf $HOME/.tmux/resurrect/last.txt $HOME/.tmux/resurrect/last
}




#-------------------------------------
#          Unit Tests
#-------------------------------------

do_test_installment(){
    if [ -e $HOME/.tmux ];then
        echo "[  OK  ]:----TMUX----"
    else
        echo "[  FAILED  ]:----TMUX----"
    fi
}



#-------------------------------------
#          Entry points
#-------------------------------------

do_install_tmux "$@"
