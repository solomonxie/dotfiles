#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu / Raspbian / MacOS Sierra
# Commands:
#   1. Get in tmux
#   2. Install plugins: Ctrl-b + Ctrl-I
#   3. Reload configs: Ctrl-b + r
#   4. Resurrect: Ctrl-b + Ctrl-r

set -x

REPO_ROOT="https://raw.githubusercontent.com/solomonxie/dotfiles/master"


do_install_tmux(){
    if [ "$1" = "--distro" ];then
        distro="$2"
    fi
    case $distro in
        "ubuntu")
            install_tmux_ubuntu ;;
        "raspbian")
            install_tmux_rpi ;;
        "mac")
            install_tmux_mac ;;
    esac
}

install_tmux_ubuntu(){
    yes | sudo apt-get install tmux
    TMUX="$HOME/.tmux"
    sudo mkdir -p $TMUX

    echo "----------[  Overwrite .tmux.conf   ]--------------"
    curl -fsSL $REPO_ROOT/tmux/tmux-ubuntu.conf -o $HOME/.tmux.conf

    echo "----------[  Installing TPM for Tmux   ]--------------"
    sudo git clone --no-checkout https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    echo "----------[  Recover preset Tmux session   ]--------------"
    sudo mkdir -p $TMUX/resurrect
    curl -fsSL $REPO_ROOT/tmux/resurrect/last-ubuntu.txt -o $TMUX/resurrect/last-ubuntu.txt
    sudo ln -sf $TMUX/resurrect/last.txt $TMUX/resurrect/last

    echo "----------[   Change permission   ]--------------"
    sudo chown -R ubuntu:ubuntu ~/.tmux
}

install_tmux_rpi(){
    yes | sudo apt-get install tmux

    echo "----------[  Overwrite .tmux.conf   ]--------------"
    cp ./tmux-rpi.conf ~/.tmux.conf

    echo "----------[  Installing TPM for Tmux   ]--------------"
    sudo git clone --no-checkout https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    echo "----------[  Recover preset Tmux session   ]--------------"
    sudo mkdir ~/.tmux/resurrect
    cp ./resurrect/last-rpi.txt ~/.tmux/resurrect/last.txt
    sudo ln -sf ~/.tmux/resurrect/last.txt ~/.tmux/resurrect/last

    echo "----------[   Change permission   ]--------------"
    sudo chown -R pi:pi ~/.tmux
}

install_tmux_mac(){
    echo "tmux on mac"
}


# Entry point
do_install_tmux $1 $2