# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
#
#
# =======SETING UP VIM =======
echo "========== (OVERWRITING VIMRC CONFIG) ==========="
sudo wget https://github.com/solomonxie/cdn/raw/master/server/vim/vimrc -O ~/.vimrc

echo "========== (Change permission) ==========="
sudo chown ubuntu ~/.vim
echo "========== (DOWNLOADING VUNDLE - VIM PLUGIN MANAGER) ==========="
sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "========== (INSTALLING VIM COLOR SCHEME) ==========="
sudo mkdir ~/.vim/colors
sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/server/vim/colors/gruvbox.vim -O ~/.vim/colors/gruvbox.vim
echo "========== (UPGRADING VIM) ==========="
# buggy one
#yes | sudo apt-get upgrade vim
if [$? != 0];then
    echo "=======Failed on upgrading vim======="
    exit 1;
fi
