# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
#
# =======SETING UP ZSH =======
echo "========== (START SETTING UP ZSH) ==========="
yes | sudo apt-get install zsh
echo "========== (INSTALLING OH-MY-ZSH) ==========="
sudo curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
# install plugins
echo "========== (INSTALLING PLUGINS FOR ZSH) ==========="
sudo git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
sudo git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
yes | sudo pip install --user powerline-status
# Setup configs
echo "========== (OVERWRITE ZSHRC) ==========="
sudo wget https://github.com/solomonxie/cdn/raw/master/zsh/zshrc -O ~/.zshrc
