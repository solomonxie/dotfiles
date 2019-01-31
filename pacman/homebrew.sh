#! /usr/bin/env bash
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: MacOS Sierra

set -x

REPO_URL="https://raw.githubusercontent.com/solomonxie/dotfiles/master"


do_setup_homebrew(){
    install_homebrew
    while [ $# -gt 0 ] ;do
        case "$1" in
            "--geo")
                case $2 in
                    cn) change_source_cn
                esac
                shift 2;;
        esac
    done
    install_utils_mac
}


install_homebrew(){
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

}

install_utils_mac(){
    # Debugging for bash script
    brew install bashdb
    brew install watch
}

update_gnu_utils_mac(){
    # Install GNU core utilities (those that come with OS X are outdated)
    brew install coreutils

    # Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
    brew install findutils

    # Install gnu-tar, g-prefixed
    brew install gnu-tar

    # Install Bash v4
    brew install bash
    # Install pcregrep. Learn it, live it, love it.
    brew install pcre

    # Add PATH to ~/.bash_profile, so that we can type commands directly 
    cat <<-EOF >> ~/.bash_profile
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
    export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"
    EOF
}

change_source_cn(){
    # change source of brew.git
    cd "$(brew --repo)"
    git remote set-url origin https://mirrors.ustc.edu.cn/brew.git
    # change source of homebrew-core.git
    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
    # Change source for bottle
    echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.zshrc
    source ~/.zshrc
    echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.bash_profile
    source ~/.bash_profile
}

change_source_default(){
    # brew.git:
    cd "$(brew --repo)"
    git remote set-url origin https://github.com/Homebrew/brew.git
    # homebrew-core.git:
    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin https://github.com/Homebrew/homebrew-core.git
}


# Entry point
do_setup_homebrew