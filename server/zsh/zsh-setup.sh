# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
#

cd ~/.init

# =======SETING UP ZSH =======
echo "========== (START SETTING UP ZSH) ==========="
yes | sudo apt-get install zsh >> log_zsh.txt 2>&1
if [$? != 0]; then
    echo "========Failed to install ZSH========"
    exit 1;
fi
echo "========== (INSTALLING OH-MY-ZSH) ==========="
sudo curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh >> log_zsh.txt 2>&1
echo "========== (OVERWRITE ZSHRC) ==========="
sudo wget https://github.com/solomonxie/cdn/raw/master/server/zsh/zshrc -O ~/.zshrc >> log_zsh.txt 2>&1
sudo wget https://github.com/solomonxie/cdn/raw/master/server/zsh/zshrc.extension -O ~/.zshrc.extension >> log_zsh.txt 2>&1
echo "======= (Installing Themes for ZSH) ========="
sudo git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k >> log_zsh.txt 2>&1
sudo wget https://raw.githubusercontent.com/agnoster/agnoster-zsh-theme/master/agnoster.zsh-theme -P ~/.oh-my-zsh/themes/ >> log_zsh.txt 2>&1
yes | sudo pip install --user powerline-status >> log_zsh.txt 2>&1
echo "========== (INSTALLING PLUGINS FOR ZSH) ==========="
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting >> log_zsh.txt 2>&1
sudo git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions >> log_zsh.txt 2>&1
if [$? != 0]; then
    echo "========Failed to install Plugins for ZSH========"
    exit 1;
fi
