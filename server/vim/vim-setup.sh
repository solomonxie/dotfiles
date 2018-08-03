# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
#
#
# =======SETING UP VIM =======
# Upgrade vim
echo "========== (UPGRADING VIM) ==========="
yes | sudo apt-get upgrade vim
# Download Vundle (Plugin Manager)
echo "========== (DOWNLOADING VUNDLE - VIM PLUGIN MANAGER) ==========="
sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Download color theme
echo "========== (INSTALLING VIM COLOR SCHEME) ==========="
sudo mkdir ~/.vim/colors
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/server/colors/gruvbox.vim -O ~/.vim/colors/gruvbox.vim
# Download preset vimrc config file
echo "========== (OVERWRITING VIMRC CONFIG) ==========="
sudo wget https://github.com/solomonxie/cdn/raw/master/server/vim/vimrc -O ~/.vimrc
