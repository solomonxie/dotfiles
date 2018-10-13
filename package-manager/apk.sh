#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Alpine Linux

do_install_tools(){
    apk add curl wget unzip
}

do_install_tools_arm(){
    apk add curl wget unzip
}
