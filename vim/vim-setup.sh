# =======SETING UP VIM =======
# Upgrade vim
yes | sudo apt-get upgrade vim
# Download Vundle (Plugin Manager)
sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Download preset vimrc config file
sudo wget https://github.com/solomonxie/cdn/raw/master/vim/vimrc -O ~/.vimrc
# Download gruvbox theme
sudo mkdir ~/.vim/colors
sudo wget https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -O ~/.vim/colors/gruvbox.vim
