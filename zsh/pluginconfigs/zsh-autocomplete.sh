# https://github.com/marlonrichert/zsh-autocomplete
if [ ! -e ~/.zsh_plugins/zsh-autocomplete ];then
    git clone https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh_plugins/zsh-autocomplete
fi
source ~/.zsh_plugins/zsh-autocomplete/zsh-autocomplete.zsh
zstyle ':autocomplete:*:no-matches-yet' message ''  # Disable idle message
zstyle ':autocomplete:space:*' magic correct-word expand-history
zstyle ':autocomplete:tab:*' completion cycle
zstyle ':autocomplete:*' fuzzy-search off
