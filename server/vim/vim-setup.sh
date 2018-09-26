# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
#

cd ~/.init

mkdir ~/.vim
export VIM=~/.vim

# =======SETING UP VIM =======
echo "========== (OVERWRITING VIMRC CONFIG) ==========="
wget https://github.com/solomonxie/cdn/raw/master/server/vim/vimrc -O ~/.vimrc >> log_vim.txt 2>&1


echo "========== (DOWNLOADING VUNDLE - VIM PLUGIN MANAGER) ==========="
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim >> log_vim.txt 2>&1


#echo "========== (Change permission) ==========="
#sudo chown $USER $VIM >> log_vim.txt 2>&1

echo "========== (INSTALLING VIM COLOR SCHEME) ==========="
mkdir ~/.vim/colors >> log_vim.txt 2>&1
wget https://raw.githubusercontent.com/solomonxie/cdn/master/server/vim/colors/gruvbox.vim -O ~/.vim/colors/gruvbox.vim >> log_vim.txt 2>&1

# buggy one
#echo "========== (UPGRADING VIM) ==========="
#yes | sudo apt-get upgrade vim
