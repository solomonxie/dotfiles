# https://github.com/romkatv/powerlevel10k#manual
if [ ! -e ~/.zsh_plugins/powerlevel10k ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh_plugins/powerlevel10k
fi
source ~/.zsh_plugins/powerlevel10k/powerlevel10k.zsh-theme
