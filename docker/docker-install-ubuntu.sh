#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# Notice: 

do_install_docker_quick(){
    curl -fsSL get.docker.com -o get-docker.sh && sudo sh get-docker.sh
}

do_install_docker_manually(){
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

do_give_permission_to_docker(){
    # add Docker group
    sudo groupadd docker
    # add current user to Docker group
    sudo gpasswd -a $USER docker
    # Reload current group
    newgrp docker
}

do_setup_config(){
    sudo wget https://raw.githubusercontent.com/solomonxie/cdn/master/docker/daemon.json -O /etc/docker/daemon.json
}

do_install_docker_manually
do_give_permission_to_docker
do_setup_config