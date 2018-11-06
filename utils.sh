# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu / Raspbian / MacOS
#
# How to use: 
#   source this script in ~/.bashrc
#   $ curl -sSL $REPO_ROOT//utils.sh -o $HOME/.bash-utils.sh
#   $ echo "source $HOME/.bash-utils.sh" >> $HOME/.bash_profile
#   $ source $HOME/.bash_profile
#

get_distro(){
    local distro=""
    if [ -x "$(command -v lsb_release)" ]; then #Linux
        distro=$(lsb_release -si | tr '[:upper:]' '[:lower:]')
    elif [ -x "$(command -v sw_vers)" ]; then #MacOS
        #distro=$(sw_vers -productName)
        distro="mac"
    elif [ -x "$(command -v uname)" ]; then #Others
        local info=$(uname -a | tr '[:upper:]' '[:lower:]')
        if [[ $info == *"Darwin"* ]]; then
            distro="mac"
        elif [[ $info == *"Ubuntu"* ]]; then
            distro="ubuntu"
        elif [[ $info == *"raspberrypi"* ]]; then
            distro="raspbian"
        elif [[ $info == *"Linux"* ]]; then
            distro="linux"
        else
            distro="OTHERS"
        fi
    fi
    echo $distro
}

get_os(){
    case $(get_distro) in
        "ubuntu")
            echo "CURRENT Linux Distribution: [  Ubuntu  ].";;
        "raspbian")
            echo "CURRENT Linux Distribution: [  Raspbian  ].";;
        "mac")
            echo "CURRENT OS: [  Mac OS X  ].";;
    esac
}
