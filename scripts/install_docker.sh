#! /usr/bin/env bash
#
# Enviroment: Ubuntu / Rpi
#
# Run:
#   $ ./install_docker.sh --os ubuntu
# Debug:
#   $ bashdb ./install_docker.sh --os ubuntu


set -x

# Read environment variables
if [ ! -e /tmp/env-os -a -e /tmp/env-user ]; then
    echo "Please run './configure' before installment."
    exit 1;
else
    export MYOS=`cat /tmp/env-os`
    export USER=`cat /tmp/env-user`
fi

#-------------------------------------
#     Installation Methods
#-------------------------------------

do_install_docker_by_os(){
    # Do different things with different OS
    case $MYOS in
        ubuntu)
            install_docker_quick
            docker_add_permission
            sudo sh $PWD/docker-apps.sh --os ubuntu
            ;;
        raspbian)
            install_docker_quick
            docker_add_permission
            docker_setup
            ;;
    esac
}

install_docker_quick(){
    curl -fsSL get.docker.com -o /tmp/get-docker.sh && sudo sh /tmp/get-docker.sh
}

docker_add_permission(){
    # add Docker group
    sudo groupadd docker
    # add current user to Docker group
    sudo gpasswd -a $USER docker
    # Reload current group
    newgrp docker
    # Exit from new shell just entered above
    exit 0;
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

    # Change source
    sudo ln -sf $HOME/dotfiles/Docker/daemon.json /etc/docker/daemon.json

    # Hello-world
    sudo docker run hello-world
}




#-------------------------------------
#          Entry points
#-------------------------------------

do_install_docker_by_os "$@"
