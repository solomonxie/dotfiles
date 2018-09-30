# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Raspberry Pi (Raspbian)
# Preload:
# Commands:
#   1. Get in tmux
#   2. Install plugins: Ctrl-b + Ctrl-I
#   3. Reload configs: Ctrl-b + r
#   4. Resurrect: Ctrl-b + Ctrl-r
#


#--------------SETING UP TMUX--------------
yes | sudo apt-get install tmux >> ~/.init/log_tmux.txt 1>&2

echo "----------[  Overwrite .tmux.conf   ]--------------"
sudo wget https://github.com/solomonxie/cdn/raw/master/tmux/tmux-rpi.conf -O ~/.tmux.conf >> ~/.init/log_tmux.txt 1>&2

echo "----------[  Installing TPM for Tmux   ]--------------"
sudo git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm >> ~/.init/log_tmux.txt 1>&2

echo "----------[  Recover preset Tmux session   ]--------------"
sudo mkdir ~/.tmux/resurrect >> ~/.init/log_tmux.txt 1>&2
sudo wget https://github.com/solomonxie/cdn/raw/master/tmux/resurrect/last-rpi.txt -O ~/.tmux/resurrect/last.txt >> ~/.init/log_tmux.txt 1>&2
sudo ln -sf ~/.tmux/resurrect/last.txt ~/.tmux/resurrect/last >> ~/.init/log_tmux.txt 1>&2


echo "----------[   Change permission   ]--------------"
sudo chown -R ubuntu:ubuntu ~/.tmux >> ~/.init/log_tmux.txt
