# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Raspberry Pi (Raspbian)
#
#
# =======SETING UP VIM =======


mkdir ~/.vim
export VIM=~/.vim

# ---SETING UP VIM ---
echo "-----[  OVERWRITING VIMRC CONFIG   ]-----"
wget https://github.com/solomonxie/cdn/raw/master/vim/vimrc-rpi -O ~/.vimrc >> ~/.init/log_vim.txt 1>&2


echo "-----[  DOWNLOADING VUNDLE - VIM PLUGIN MANAGER   ]-----"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim >> ~/.init/log_vim.txt 1>&2


echo "-----[  Change permission   ]-----"
sudo chown -R ubuntu:ubuntu $VIM >> ~/.init/log_vim.txt 1>&2
#sudo chown -R ubuntu ~/.vim >> ~/.init/log_vim.txt 1>&2

echo "-----[  INSTALLING VIM COLOR SCHEME   ]-----"
mkdir ~/.vim/colors >> ~/.init/log_vim.txt 1>&2
curl https://raw.githubusercontent.com/solomonxie/cdn/master/vim/colors/gruvbox.vim --create-dirs -o ~/.vim/colors/gruvbox.vim >> ~/.init/log_vim.txt 1>&2

# buggy one
#echo "-----[  UPGRADING VIM   ]-----"
#yes | sudo apt-get upgrade vim
