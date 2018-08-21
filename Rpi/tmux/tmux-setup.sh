# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Raspberry Pi (Raspbian)
# Preload:
# Commands:
#
# =======SETING UP TMUX =======
sudo apt-get install tmux
if [$? != 0];then
    echo "=====Failed on installing Tmux======="
    exit 1;
fi
echo "===== (Overwrite .tmux.conf) ======="
sudo wget https://github.com/solomonxie/cdn/raw/master/Rpi/tmux/tmux.conf -O ~/.tmux.conf
echo "===== (Installing TPM for Tmux) ======="
sudo chown -R pi ~/.tmux
sudo git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "===== (Recover preset Tmux session) ======="
sudo mkdir ~/.tmux/resurrect
sudo wget https://github.com/solomonxie/cdn/raw/master/Rpi/tmux/resurrect/last.txt -O ~/.tmux/resurrect/last.txt
sudo ln -sf ~/.tmux/resurrect/last.txt ~/.tmux/resurrect/last


