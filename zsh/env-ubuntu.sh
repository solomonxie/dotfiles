source ~/dotfiles/zsh/zshrc-mini.sh

export LC_ALL=C


# Environment Variables, paths
# Some would be imported here by other programms automatically
# etc., cat 'expot path=...' > ~/.zshrc

export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# Python
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/virtualenv/venv2/bin:$PATH"
export PATH="$HOME/virtualenv/venv/bin:$PATH"

export EDITOR=vim
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export OCTAVE_EXECUTABLE=/usr/local/bin/octave
