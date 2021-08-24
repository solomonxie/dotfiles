# if [ ! -e ~/.zsh_plugins/pure ]; then
#     git clone https://github.com/sindresorhus/pure.git ~/.zsh_plugins/pure
# fi
# fpath+="$HOME/.zsh_plugins/pure"
# autoload -U promptinit; promptinit
# prompt pure
# zstyle :prompt:pure:git:stash show yes
# zstyle :prompt:pure:path color '#FF0000'


if [ ! -e ~/.zsh_plugins/typewritten ]; then
    git clone https://github.com/reobin/typewritten.git ~/.zsh_plugins/typewritten
fi
export TYPEWRITTEN_PROMPT_LAYOUT="singleline"
export TYPEWRITTEN_SYMBOL="$"
fpath+="$HOME/.zsh_plugins/typewritten"
autoload -U promptinit; promptinit
prompt typewritten
