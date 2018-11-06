#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
#

set -x

yes | sudo apt-get install vim

mkdir ~/.vim
export VIM="~/.vim"

# ---SETING UP VIM ---
echo "-----[  OVERWRITING VIMRC CONFIG   ]-----"
wget https://github.com/solomonxie/dotfiles/raw/master/vim/vimrc-ubuntu -O ~/.vimrc


echo "-----[  DOWNLOADING VUNDLE - VIM PLUGIN MANAGER   ]-----"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


echo "-----[  Change permission   ]-----"
sudo chown -R ubuntu:ubuntu ~/.vim
# sudo chown -R ubuntu ~/.vim >> ~/.init/log_vim.txt 1>&2

echo "-----[  INSTALLING VIM COLOR SCHEME   ]-----"
mkdir ~/.vim/colors
curl https://raw.githubusercontent.com/solomonxie/dotfiles/master/vim/colors/gruvbox.vim --create-dirs -o ~/.vim/colors/gruvbox.vim 

# buggy one
#echo "-----[  UPGRADING VIM   ]-----"
#yes | sudo apt-get upgrade vim
