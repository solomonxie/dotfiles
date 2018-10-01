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
yes | sudo apt-get install tmux

echo "----------[  Overwrite .tmux.conf   ]--------------"
sudo wget https://github.com/solomonxie/cdn/raw/master/tmux/tmux-rpi.conf -O ~/.tmux.conf

echo "----------[  Installing TPM for Tmux   ]--------------"
sudo git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "----------[  Recover preset Tmux session   ]--------------"
sudo mkdir ~/.tmux/resurrect
sudo wget https://github.com/solomonxie/cdn/raw/master/tmux/resurrect/last-rpi.txt -O ~/.tmux/resurrect/last.txt
sudo ln -sf ~/.tmux/resurrect/last.txt ~/.tmux/resurrect/last


echo "----------[   Change permission   ]--------------"
sudo chown -R pi:pi ~/.tmux
