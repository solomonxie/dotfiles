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

ME=${SUDO_USER:-$(id -un)}
HOUSE="`cat /etc/passwd |grep ^${ME}: | cut -d: -f 6`"
HOUSE=${HOUSE:-$HOME}
echo $HOUSE
REPO_URL="git@github.com:solomonxie/dotfiles.git"
SRC="$HOUSE/dotfiles"

# Download Repo if not exists
if [ ! -e $HOUSE/dotfiles ]; then
    git clone $REPO_URL $HOUSE/dotfiles
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
    mkdir -p $HOUSE/.tmux/resurrect
    # Do different things with different OS
    case $OS in
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

    echo "----------[  Overwrite .tmux.conf   ]--------------"
    curl -fsSL $REPO_URL/tmux/tmux-ubuntu.conf -o $HOUSE/.tmux.conf
    echo "----------[  Recover preset Tmux session   ]--------------"
    curl -fsSL $REPO_URL/tmux/resurrect/last-ubuntu.txt -o $HOUSE/.tmux/resurrect/last.txt
    ln -sf $HOUSE/.tmux/resurrect/last.txt $HOUSE/.tmux/resurrect/last
}

install_tmux_rpi(){
    yes | sudo apt-get install tmux

    echo "----------[  Overwrite .tmux.conf   ]--------------"
    curl -fsSL $REPO_URL/tmux/tmux-rpi.conf -o $HOUSE/.tmux.conf
    echo "----------[  Recover preset Tmux session   ]--------------"
    curl -fsSL $REPO_URL/tmux/resurrect/last-rpi.txt -o $HOUSE/.tmux/resurrect/last.txt
    ln -sf $HOUSE/.tmux/resurrect/last.txt $HOUSE/.tmux/resurrect/last
}

install_tmux_mac(){
    brew install tmux  

    echo "----------[  Overwrite .tmux.conf   ]--------------"
    curl -fsSL $REPO_URL/tmux/tmux-mac.conf -o ~/.tmux.conf
    echo "----------[  Recover preset Tmux session   ]--------------"
    curl -fsSL $REPO_URL/tmux/resurrect/last-mac.txt -o $HOUSE/.tmux/resurrect/last.txt
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