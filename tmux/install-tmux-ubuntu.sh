#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# Preload:
# Commands:
#   1. Get in tmux
#   2. Install plugins: Ctrl-b + Ctrl-I
#   3. Reload configs: Ctrl-b + r
#   4. Resurrect: Ctrl-b + Ctrl-r
#

set -x

REPO_ROOT="https://raw.githubusercontent.com/solomonxie/dotfiles/master"


#--------------SETING UP TMUX--------------
yes | sudo apt-get install tmux

echo "----------[  Overwrite .tmux.conf   ]--------------"
sudo wget https://github.com/solomonxie/dotfiles/raw/master/tmux/tmux-ubuntu.conf -O ~/.tmux.conf

echo "----------[  Installing TPM for Tmux   ]--------------"
sudo git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "----------[  Recover preset Tmux session   ]--------------"
sudo mkdir ~/.tmux/resurrect
sudo wget https://github.com/solomonxie/dotfiles/raw/master/tmux/resurrect/last-ubuntu.txt -O ~/.tmux/resurrect/last.txt
sudo ln -sf ~/.tmux/resurrect/last.txt ~/.tmux/resurrect/last


echo "----------[   Change permission   ]--------------"
sudo chown -R ubuntu:ubuntu ~/.tmux

