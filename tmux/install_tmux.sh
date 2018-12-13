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

MYHOME="`cat /etc/passwd |grep ${SUDO_UID:-$(id -u)} | cut -d: -f 6`"
MYHOME=${MYHOME:-$HOME}
REPO_URL="git@github.com:solomonxie/dotfiles.git"
SRC="$MYHOME/dotfiles"

# Download Repo if not exists
if [ ! -e $MYHOME/dotfiles ]; then
    git clone $REPO_URL $MYHOME/dotfiles
fi

# Check flags
if [ $# -eq 0 ]; then 
    echo "[ Failed ] Please specify OS version with --os flag."
    return 1; 
fi

#-------------------------------------
#     Installation Methods
#-------------------------------------

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
    # Make paths for tmux extensions
    mkdir -p $MYHOME/.tmux/resurrect
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
    curl -fsSL $REPO_URL/tmux/resurrect/last-ubuntu.txt -o $MYHOME/.tmux/resurrect/last.txt
    ln -sf $MYHOME/.tmux/resurrect/last.txt $MYHOME/.tmux/resurrect/last
}

install_tmux_rpi(){
    yes | sudo apt-get install tmux

    echo "----------[  Overwrite .tmux.conf   ]--------------"
    curl -fsSL $REPO_URL/tmux/tmux-rpi.conf -o $MYHOME/.tmux.conf
    echo "----------[  Recover preset Tmux session   ]--------------"
    curl -fsSL $REPO_URL/tmux/resurrect/last-rpi.txt -o $MYHOME/.tmux/resurrect/last.txt
    ln -sf $MYHOME/.tmux/resurrect/last.txt $MYHOME/.tmux/resurrect/last
}

install_tmux_mac(){
    brew install tmux  

    echo "----------[  Overwrite .tmux.conf   ]--------------"
    curl -fsSL $REPO_URL/tmux/tmux-mac.conf -o ~/.tmux.conf
    echo "----------[  Recover preset Tmux session   ]--------------"
    curl -fsSL $REPO_URL/tmux/resurrect/last-mac.txt -o $MYHOME/.tmux/resurrect/last.txt
    ln -sf $MYHOME/.tmux/resurrect/last.txt $MYHOME/.tmux/resurrect/last
}




#-------------------------------------
#          Unit Tests
#-------------------------------------

do_test_installment(){
    if [ -e $MYHOME/.tmux ];then
        echo "[  OK  ]:----TMUX----"
    else
        echo "[  FAILED  ]:----TMUX----"
    fi
}



#-------------------------------------
#          Entry points
#-------------------------------------

do_install_tmux "$@"