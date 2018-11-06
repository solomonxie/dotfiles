#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu / Raspbian / MacOS Sierra
# Run:
#   $ install_zsh.sh "Mac OS X"

set -x

do_init_zsh(){
    # Load uitility functions (check os)
    curl -fsSL https://raw.githubusercontent.com/solomonxie/dotfiles/master/utils.sh -o $HOME/.bash-utils.sh
    source $HOME/.bash-utils.sh
    # Get Distro
    distro=$(get_distro)
    case distro in
        "ubuntu")
            do_install_zsh_ubuntu ;;
        "raspbian")
            do_install_zsh_rpi ;;
        "mac")
            do_install_zsh_mac ;;
    esac
}


install_zsh_rpi(){
    echo "-----[  START SETTING UP ZSH   ]-----"
    sudo apt-get install zsh -y

    echo "-----[  INSTALLING OH-MY-ZSH   ]-----"
    curl -sSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sudo sh

    echo "-----[  OVERWRITE ZSHRC   ]-----"
    sudo cp $HOME/dotfiles/zsh/zshrc-rpi ~/.zshrc
    sudo cp $HOME/dotfiles/zsh/zshrc.extension-rpi ~/.zshrc.extension


    echo "-----[  Installing Themes for ZSH   ]-----"
    sudo git clone --no-checkout https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    sudo wget -q https://raw.githubusercontent.com/agnoster/agnoster-zsh-theme/master/agnoster.zsh-theme -P ~/.oh-my-zsh/themes/
    sudo pip install powerline-status >> ~/.init/log_zsh.txt 1>&2

    echo "-----[  Installing Themes for ZSH   ]-----"
    sudo chown -R pi:pi $ZSH_CUSTOM

    # Enter Z-Shell
    /bin/zsh

    echo "-----[  INSTALLING PLUGINS FOR ZSH   ]-----"
    sudo git clone --no-checkout https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting 
    sudo git clone --no-checkout https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
}

install_zsh_ubuntu(){
    echo "-----[  START SETTING UP ZSH   ]-----"
    sudo apt-get install zsh -y

    echo "-----[  INSTALLING OH-MY-ZSH   ]-----"
    curl -sSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sudo sh

    echo "-----[  OVERWRITE ZSHRC   ]-----"
    sudo cp $HOME/dotfiles/zsh/zshrc-ubuntu ~/.zshrc
    sudo cp $HOME/dotfiles/zsh/zshrc.extension-ubuntu ~/.zshrc.extension

    echo "-----[  Installing Themes for ZSH   ]-----"
    sudo git clone --no-checkout https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    sudo wget -q https://raw.githubusercontent.com/agnoster/agnoster-zsh-theme/master/agnoster.zsh-theme -P ~/.oh-my-zsh/themes/
    sudo pip install powerline-status

    echo "-----[  Installing Themes for ZSH   ]-----"
    sudo chown -R ubuntu:ubuntu $ZSH_CUSTOM

    # Enter Z-Shell
    /bin/zsh

    echo "-----[  INSTALLING PLUGINS FOR ZSH   ]-----"
    sudo git clone --no-checkout https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    sudo git clone --no-checkout https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
}

# Start this script
do_init_zsh