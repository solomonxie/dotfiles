#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# ENVIRONMENT: Ubuntu / Raspbian / MacOS
# NOTICE:

MYHOME="`cat /etc/passwd |grep ${SUDO_UID:-$(id -u)} | cut -d: -f 6`"
MYHOME=${MYHOME:-$HOME}
echo $MYHOME
REPO_URL="git@github.com:solomonxie/dotfiles.git"
SRC="$MYHOME/dotfiles"

# Download Repo if not exists
if [ ! -e $MYHOME/dotfiles ]; then
    git clone $REPO_URL $MYHOME/dotfiles
fi

# Check flags
if [ $# -eq 0 ]; then 
    echo "[ Failed ] Please specify OS version with --os flag."
    return 1; 
fi


#-------------------------------------
#     Initialization Functions
#-------------------------------------


ln -sf $MYHOME/dotfiles/vim/vimrc $MYHOME/.vimrc
ln -sf $MYHOME/dotfiles/zsh/zshrc $MYHOME/.zshrc
ln -sf $MYHOME/dotfiles/zsh/zshrc.extension $MYHOME/.zshrc.extension
ln -sf $MYHOME/dotfiles/zsh/zshrc.themes $MYHOME/.zshrc.themes
ln -sf $MYHOME/dotfiles/tmux/tmux.conf $MYHOME/.tmux.conf
