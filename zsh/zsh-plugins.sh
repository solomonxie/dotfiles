#######################################################################
#                         THIRD PARTY PLUGINS                         #
#######################################################################
# Fish-like commandline suggestions (not working with oh-my-zsh)
if [ ! -e ~/.zsh/plugins/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
fi
# ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'
HISTFILE=~/.bash_history
HISTSIZE=50000
SAVEHIST=10000
setopt appendhistory
setopt extendedhistory
setopt sharehistory
setopt incappendhistory
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# Syntax highlighting
if [ ! -e ~/.zsh/plugins/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting
fi
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Print last command's execution time
if [ ! -e ~/.zsh/plugins/zsh-command-time ]; then
    git clone https://github.com/popstas/zsh-command-time.git ~/.zsh/plugins/zsh-command-time
fi
source ~/.zsh/plugins/zsh-command-time/command-time.plugin.zsh
