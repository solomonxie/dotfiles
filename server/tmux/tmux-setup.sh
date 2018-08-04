# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#
# =======SETING UP TMUX =======
sudo apt-get install tmux
if [$? != 0];then
    echo "=====Failed on installing Tmux======="
    exit 1;
fi
sudo git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo wget https://github.com/solomonxie/cdn/raw/master/server/tmux/tmux.conf -O ~/.tmux.conf
