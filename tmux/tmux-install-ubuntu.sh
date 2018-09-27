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

cd ~/.init

#--------------SETING UP TMUX--------------
yes | sudo apt-get install tmux >> log_tmux.txt 2>&1

echo "----------[  Overwrite .tmux.conf   ]--------------"
sudo wget https://github.com/solomonxie/cdn/raw/master/tmux/tmux-ubuntu.conf -O ~/.tmux.conf >> log_tmux.txt 2>&1

echo "----------[  Installing TPM for Tmux   ]--------------"
sudo git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm >> log_tmux.txt 2>&1

echo "----------[  Recover preset Tmux session   ]--------------"
sudo mkdir ~/.tmux/resurrect >> log_tmux.txt 2>&1
sudo wget https://github.com/solomonxie/cdn/raw/master/tmux/resurrect/last-ubuntu.txt -O ~/.tmux/resurrect/last.txt >> log_tmux.txt 2>&1
sudo ln -sf ~/.tmux/resurrect/last.txt ~/.tmux/resurrect/last >> log_tmux.txt 2>&1


echo "----------[   Change permission   ]--------------"
sudo chown -R $USER ~/.tmux >> log_tmux.txt

