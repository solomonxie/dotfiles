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

# Load uitility functions (check os)
curl -fsSL https://raw.githubusercontent.com/solomonxie/cdn/master/utils.sh -o ~/utils.sh
source ~/utils.sh

do_install_tmux(){
    # Get Distro
    distro=$(get_distro)
    case distro in
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

    echo "----------[  Overwrite .tmux.conf   ]--------------"
    sudo wget https://github.com/solomonxie/cdn/raw/master/tmux/tmux-ubuntu.conf -O ~/.tmux.conf

    echo "----------[  Installing TPM for Tmux   ]--------------"
    sudo git clone --no-checkout https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    echo "----------[  Recover preset Tmux session   ]--------------"
    sudo mkdir ~/.tmux/resurrect
    sudo wget https://github.com/solomonxie/cdn/raw/master/tmux/resurrect/last-ubuntu.txt -O ~/.tmux/resurrect/last.txt
    sudo ln -sf ~/.tmux/resurrect/last.txt ~/.tmux/resurrect/last

    echo "----------[   Change permission   ]--------------"
    sudo chown -R ubuntu:ubuntu ~/.tmux
}

install_tmux_rpi(){
    yes | sudo apt-get install tmux

    echo "----------[  Overwrite .tmux.conf   ]--------------"
    sudo wget https://github.com/solomonxie/cdn/raw/master/tmux/tmux-rpi.conf -O ~/.tmux.conf

    echo "----------[  Installing TPM for Tmux   ]--------------"
    sudo git clone --no-checkout https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    echo "----------[  Recover preset Tmux session   ]--------------"
    sudo mkdir ~/.tmux/resurrect
    sudo wget https://github.com/solomonxie/cdn/raw/master/tmux/resurrect/last-rpi.txt -O ~/.tmux/resurrect/last.txt
    sudo ln -sf ~/.tmux/resurrect/last.txt ~/.tmux/resurrect/last

    echo "----------[   Change permission   ]--------------"
    sudo chown -R pi:pi ~/.tmux
}

install_tmux_mac(){
    echo "tmux on mac"
}
