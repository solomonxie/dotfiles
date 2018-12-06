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


set -ax

MYHOME=`getent passwd ${SUDO_UID:-$(id -u)} | cut -d: -f 6`
REPO_URL="https://raw.githubusercontent.com/solomonxie/dotfiles/master"
SRC="$MYHOME/dotfiles"
OS=""

TMUX="$MYHOME/.tmux"
mkdir -p $TMUX/resurrect

do_install_tmux(){
    # Get distro information
    while [ $# -gt 0 ] ;do
        case "$1" in
            "--os")
                OS=$2 
                shift 2;;
            "--src")
                SRC=$2 
                shift 2;;
        esac
    done
    # Do different things with different OS
    case $distro in
        "ubuntu")
            install_tmux_ubuntu ;;
        "raspbian")
            install_tmux_rpi ;;
        "mac")
            install_tmux_mac ;;
    esac
    # Download & Install plugins
    echo "----------[  Installing TPM for Tmux   ]--------------"
    git clone https://github.com/tmux-plugins/tpm $MYHOME/.tmux/plugins/tpm
    $MYHOME/.tmux/plugins/tpm/bin/install_plugins
}

install_tmux_ubuntu(){
    yes | sudo apt-get install tmux

    echo "----------[  Overwrite .tmux.conf   ]--------------"
    curl -fsSL $REPO_URL/tmux/tmux-ubuntu.conf -o $MYHOME/.tmux.conf
    echo "----------[  Recover preset Tmux session   ]--------------"
    curl -fsSL $REPO_URL/tmux/resurrect/last-ubuntu.txt -o $TMUX/resurrect/last.txt
    ln -sf $TMUX/resurrect/last.txt $TMUX/resurrect/last
}

install_tmux_rpi(){
    yes | sudo apt-get install tmux

    echo "----------[  Overwrite .tmux.conf   ]--------------"
    curl -fsSL $REPO_URL/tmux/tmux-rpi.conf -o $MYHOME/.tmux.conf
    echo "----------[  Recover preset Tmux session   ]--------------"
    curl -fsSL $REPO_URL/tmux/resurrect/last-rpi.txt -o $TMUX/resurrect/last.txt
    ln -sf $TMUX/resurrect/last.txt $TMUX/resurrect/last
}

install_tmux_mac(){
    brew install tmux  

    echo "----------[  Overwrite .tmux.conf   ]--------------"
    curl -fsSL $REPO_URL/tmux/tmux-mac.conf -o ~/.tmux.conf
    echo "----------[  Recover preset Tmux session   ]--------------"
    curl -fsSL $REPO_URL/tmux/resurrect/last-mac.txt -o $TMUX/resurrect/last.txt
    ln -sf $TMUX/resurrect/last.txt $TMUX/resurrect/last
}

do_test_installment(){
    if [ -e $MYHOME/.tmux ];then
        echo "[  OK  ]:----TMUX----"
    else
        echo "[  FAILED  ]:----TMUX----"
    fi
}

# Entry point
do_install_tmux "$@"