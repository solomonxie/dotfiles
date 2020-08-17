# https://github.com/junegunn/fzf

# Import binary execution to PATH
if [[ ! "$PATH" == *~/.fzf/bin* ]]; then export PATH="$PATH:$HOME/.fzf/bin"; fi


# Import key bindings for auto completion
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null


# Setup appearence (Highlighting, scale, preview...)
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"


# Setup default searching tool (to replace "find")
if [ -x $(command -v ag) ]; then
    export FZF_DEFAULT_COMMAND='ag -g ""'
elif [ -x $(command -v fd) ]; then
    export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude .git'
    #export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
elif [ -x $(command -v rg) ]; then
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden \
        --follow --glob "!{.git,node_modules}/*" 2> /dev/null'
#elif [ -x $(command -v ag) ]; then
    #
fi

# Import specific key bindings
source "$HOME/.fzf/shell/key-bindings.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
