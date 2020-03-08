###################################################
#                     _                           #
#             _______| |__  _ __ ___              #
#            |_  / __| '_ \| '__/ __|             #
#             / /\__ \ | | | | | (__              #
#            /___|___/_| |_|_|  \___|             #
#                                                 #
#                                                 #
###################################################
         source ~/dotfiles/zsh/zshrc-mac.sh
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#
###################################################


# MAIN CONFIGURATION
# source ~/dotfiles/zsh/zshrc-mac

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc

# Environment Variables, paths
# Some would be imported here by other programms automatically
# etc., cat 'expot path=...' > ~/.zshrc

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Python executables
export PATH="$PATH:`python -m site --user-base`/bin"  # pip executables are here

export PATH="/usr/local/opt/curl/bin:$PATH"  # Curl newer version

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"


#Java
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home"
# export JAVA_HOME=$(/usr/libexec/java_home)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
