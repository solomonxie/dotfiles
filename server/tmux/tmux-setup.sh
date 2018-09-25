# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#

cd ~/.init

# =======SETING UP TMUX =======
sudo apt-get install tmux >> log_tmux.txt 2>&1
if [$? != 0];then
    echo "=====Failed on installing Tmux======="
    exit 1;
fi
echo "===== (Overwrite .tmux.conf) ======="
sudo wget https://github.com/solomonxie/cdn/raw/master/server/tmux/tmux.conf -O ~/.tmux.conf >> log_tmux.txt 2>&1
echo "===== (Installing TPM for Tmux) ======="
sudo chown -R ubuntu ~/.tmux >> log_tmux.txt
sudo git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm >> log_tmux.txt 2>&1
echo "===== (Recover preset Tmux session) ======="
sudo mkdir ~/.tmux/resurrect >> log_tmux.txt 2>&1
sudo wget https://github.com/solomonxie/cdn/raw/master/server/tmux/last.txt -O ~/.tmux/resurrect/last.txt >> log_tmux.txt 2>&1
sudo ln -sf ~/.tmux/resurrect/last.txt ~/.tmux/resurrect/last >> log_tmux.txt 2>&1


