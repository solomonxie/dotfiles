# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
#

# ---SETING UP ZSH ---
echo "-----[  START SETTING UP ZSH   ]-----"
yes | sudo apt-get install zsh >> ~/.init/log_zsh.txt 1>&2


echo "-----[  INSTALLING OH-MY-ZSH   ]-----"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh >> ~/.init/log_zsh.txt 1>&2

echo "-----[  OVERWRITE ZSHRC   ]-----"
wget https://github.com/solomonxie/cdn/raw/master/zsh/zshrc-ubuntu -O ~/.zshrc >> ~/.init/log_zsh.txt 1>&2
wget https://github.com/solomonxie/cdn/raw/master/zsh/zshrc.extension-ubuntu -O ~/.zshrc.extension >> ~/.init/log_zsh.txt 1>&2

echo "---[  Installing Themes for ZSH   ]----"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k >> ~/.init/log_zsh.txt 1>&2
wget https://raw.githubusercontent.com/agnoster/agnoster-zsh-theme/master/agnoster.zsh-theme -P ~/.oh-my-zsh/themes/ >> ~/.init/log_zsh.txt 1>&2
yes | sudo pip install -U powerline-status >> ~/.init/log_zsh.txt 1>&2

echo "---[  Installing Themes for ZSH   ]----"
sudo chown -R ubuntu:ubuntu $ZSH_CUSTOM

echo "-----[  INSTALLING PLUGINS FOR ZSH   ]-----"
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting >> ~/.init/log_zsh.txt 1>&2
sudo git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions >> ~/.init/log_zsh.txt 1>&2

