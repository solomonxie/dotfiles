# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Raspberry Pi (Raspbian)
#
# =======SETING UP ZSH =======
echo "========== (START SETTING UP ZSH) ==========="
yes | sudo apt-get install zsh
if [$? != 0]; then
    echo "========Failed to install ZSH========"
    exit 1;
fi

echo "========== (INSTALLING OH-MY-ZSH) ==========="
sudo curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
sudo chown pi ~/.oh-my-zsh

echo "========== (OVERWRITE ZSHRC) ==========="
sudo wget https://github.com/solomonxie/cdn/raw/master/Rpi/zsh/zshrc -O ~/.zshrc
sudo wget https://github.com/solomonxie/cdn/raw/master/Rpi/zsh/zshrc.extension -O ~/.zshrc.extension

echo "======= (Installing Themes for ZSH) ========="
sudo git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
sudo wget https://raw.githubusercontent.com/agnoster/agnoster-zsh-theme/master/agnoster.zsh-theme -P ~/.oh-my-zsh/themes/
yes | sudo pip install --user powerline-status

echo "========== (INSTALLING PLUGINS FOR ZSH) ==========="
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
sudo git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
if [$? != 0]; then
    echo "========Failed to install Plugins for ZSH========"
    exit 1;
fi
