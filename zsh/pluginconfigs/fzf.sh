# Setup fzf
# ---------
if [[ ! "$PATH" == */$HOME/myconf/config/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/$HOME/myconf/config/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"
