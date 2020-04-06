#######################################################################
#                         THIRD PARTY PLUGINS                         #
#######################################################################
# Fish-like commandline suggestions (not working with oh-my-zsh)
if [ ! -e ~/.zsh/plugins/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
fi
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting
if [ ! -e ~/.zsh/plugins/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting
fi
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Setups for plugins {
    # [zsh-autosuggestions]
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6' # [Essential]
    # [zsh-history-substring-search]
# }

