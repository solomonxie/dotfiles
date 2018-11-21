#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# Notice: 

set -x

REPO_ROOT="https://raw.githubusercontent.com/solomonxie/dotfiles/master"


do_install_docker_by_os(){
    # Get distro information
    distro=""
    while [ $# -gt 0 ] ;do
        case "$1" in
            "--distro")
                distro=$2 
                shift 2;;
        esac
    done
    # Do different things with different OS
    case $distro in
        "ubuntu")
            install_docker_quick
            docker_add_permission
            sudo sh $PWD/docker-apps.sh --distro ubuntu
            ;;
        "raspbian")
            install_docker_quick
            docker_add_permission
            docker_setup
            ;;
    esac
}

install_docker_quick(){
    curl -fsSL get.docker.com -o get-docker.sh && sudo sh get-docker.sh
}

docker_add_permission(){
    # add Docker group
    sudo groupadd docker
    # add current user to Docker group
    sudo gpasswd -a $USER docker
    # Reload current group
    newgrp docker
}

docker_setup(){
    # change sources/mirrors
    sudo cp ./docker/daemon.json /etc/docker/

    # install docker-compose
    #sudo pip install -U docker-compose
}


rm_docker(){
    sudo apt remove docker-ce -y
    sudo apt remove docker -y
}


install_docker_ubuntu(){
    # Setup SSL for downloading through HTTPS
    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
    # Add GPG key for docker
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    # Checkup the key（9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88）
    sudo apt-key fingerprint 0EBFCD88

    # Add source for apt-get
    sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update

    # Install docker
    yes | sudo apt-get install docker-ce

    # Hello-world
    sudo docker run hello-world
}

install_docker_rpi(){
    # Setup SSL for downloading through HTTPS
    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
    # Add GPG key for docker
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    # Checkup the key（9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88）
    sudo apt-key fingerprint 0EBFCD88

    # Add source for apt-get
    sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update

    # Install docker
    sudo apt-get install docker-ce
    sudo apt install docker-compose

    # Hello-world
    sudo docker run hello-world
}

# [ Entry point ]
do_install_docker_by_os "$@"