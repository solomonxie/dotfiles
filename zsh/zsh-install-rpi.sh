#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Rpi
#

set -x

REPO_ROOT="https://raw.githubusercontent.com/solomonxie/dotfiles/master"


# ---SETING UP ZSH ---
echo "-----[  START SETTING UP ZSH   ]-----"
yes | sudo apt-get install zsh


echo "-----[  INSTALLING OH-MY-ZSH   ]-----"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

echo "-----[  OVERWRITE ZSHRC   ]-----"
wget https://github.com/solomonxie/dotfiles/raw/master/zsh/zshrc-rpi -O ~/.zshrc
wget https://github.com/solomonxie/dotfiles/raw/master/zsh/zshrc.extension-rpi -O ~/.zshrc.extension

echo "---[  Installing Themes for ZSH   ]----"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
wget https://raw.githubusercontent.com/agnoster/agnoster-zsh-theme/master/agnoster.zsh-theme -P ~/.oh-my-zsh/themes/
yes | pip install -U powerline-status >> ~/.init/log_zsh.txt 1>&2

echo "---[  Installing Themes for ZSH   ]----"
sudo chown -R pi:pi $ZSH_CUSTOM

echo "-----[  INSTALLING PLUGINS FOR ZSH   ]-----"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting 
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

