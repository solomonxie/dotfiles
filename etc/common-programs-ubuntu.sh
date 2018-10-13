# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#

echo "========== (INSTALLING OFTEN USED PROGRAMS) ==========="
yes | sudo apt-get install mosh
yes | sudo apt-get install unzip
yes | sudo apt-get install ntfs-3g
yes | sudo apt-get install htop
yes | sudo apt-get install glances
yes | sudo apt-get install speedtest-cli
yes | sudo apt-get install ifstat
yes | sudo apt-get install fortune cowsay cmatrix
yes | pip install -U youtube-dl you-get tldr ffmpeg

sudo add-apt-repository ppa:dawidd0811/neofetch
yes | sudo apt update && sudo apt install neofetch