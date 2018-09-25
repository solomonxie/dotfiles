# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
#

cd ~/.init

# =======SETING UP VIM =======
echo "========== (OVERWRITING VIMRC CONFIG) ==========="
sudo wget https://github.com/solomonxie/cdn/raw/master/server/vim/vimrc -O ~/.vimrc >> log_vim.txt 2>&1

echo "========== (Change permission) ==========="
sudo chown ubuntu ~/.vim >> log_vim.txt 2>&1
echo "========== (DOWNLOADING VUNDLE - VIM PLUGIN MANAGER) ==========="
sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim >> log_vim.txt 2>&1
echo "========== (INSTALLING VIM COLOR SCHEME) ==========="
sudo mkdir ~/.vim/colors >> log_vim.txt 2>&1
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/server/vim/colors/gruvbox.vim -O ~/.vim/colors/gruvbox.vim >> log_vim.txt 2>&1
echo "========== (UPGRADING VIM) ==========="
# buggy one
#yes | sudo apt-get upgrade vim
if [$? != 0];then
    echo "=======Failed on upgrading vim======="
    exit 1;
fi
