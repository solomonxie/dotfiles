# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
#

cd ~/.init

# ---SETING UP ZSH ---
echo "-----[  START SETTING UP ZSH   ]-----"
yes | sudo apt-get install zsh >> log_zsh.txt 2>&1


echo "-----[  INSTALLING OH-MY-ZSH   ]-----"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh >> log_zsh.txt 2>&1

echo "-----[  OVERWRITE ZSHRC   ]-----"
wget https://github.com/solomonxie/cdn/raw/master/zsh/zshrc-ubuntu -O ~/.zshrc >> log_zsh.txt 2>&1
wget https://github.com/solomonxie/cdn/raw/master/zsh/zshrc.extension-ubuntu -O ~/.zshrc.extension >> log_zsh.txt 2>&1

echo "---[  Installing Themes for ZSH   ]----"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k >> log_zsh.txt 2>&1
wget https://raw.githubusercontent.com/agnoster/agnoster-zsh-theme/master/agnoster.zsh-theme -P ~/.oh-my-zsh/themes/ >> log_zsh.txt 2>&1
yes | sudo pip install -U powerline-status >> log_zsh.txt 2>&1

echo "---[  Installing Themes for ZSH   ]----"
sudo chown -R $USER $ZSH_CUSTOM

echo "-----[  INSTALLING PLUGINS FOR ZSH   ]-----"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting >> log_zsh.txt 2>&1
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions >> log_zsh.txt 2>&1

