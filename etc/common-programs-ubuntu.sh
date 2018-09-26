# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#

cd ~/.init

echo "========== (INSTALLING OFTEN USED PROGRAMS) ==========="
yes | sudo apt-get install mosh htop glances speedtest-cli ffmpeg >> log_common.txt 2>&1
yes | sudo pip install -U youtube-dl you-get tldr
