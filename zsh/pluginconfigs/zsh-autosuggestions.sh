# https://github.com/zsh-users/zsh-autosuggestions
# Fish-like commandline suggestions (not working with oh-my-zsh)
if [ ! -e ~/.zsh/plugins/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
fi
ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
