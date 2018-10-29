#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Raspberry Pi (Raspbian)
# Notice: 

do_docker_quick_install(){
    curl -fsSL get.docker.com -o get-docker.sh && sudo sh get-docker.sh
}

do_docker_manual_install(){
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

do_docker_persmission(){
    # add Docker group
    sudo groupadd docker
    # add current user to Docker group
    sudo gpasswd -a $USER docker
    # Reload current group
    newgrp docker
}

do_docker_setup(){
    # change sources/mirrors
    sudo cp ./docker/daemon.json /etc/docker/

    # install docker-compose
    #sudo pip install -U docker-compose
}

rm_docker(){
    sudo apt remove docker-ce -y
    sudo apt remove docker -y
}

do_docker_manual_install
do_docker_persmission
do_docker_setup