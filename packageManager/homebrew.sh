#! /bin/bash 
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