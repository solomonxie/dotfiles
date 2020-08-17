# https://github.com/marlonrichert/zsh-autocomplete
if [ ! -e ~/.zsh/plugins/zsh-autocomplete ];then
    git clone https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh/plugins/zsh-autocomplete
fi
source ~/.zsh/plugins/zsh-autocomplete/zsh-autocomplete.zsh
zstyle ':autocomplete:*:no-matches-yet' message ''  # Disable idle message
