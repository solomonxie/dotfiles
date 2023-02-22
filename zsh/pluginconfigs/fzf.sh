#! zsh
# REF: https://github.com/junegunn/fzf

# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/xiaoboxie/.fzf/bin* ]]; then
  export PATH="$HOME/.fzf/bin:$PATH"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"
