#! /usr/bin/env bash
#
# Enviroment: Alpine Linux

do_install_tools(){
    apk add curl wget unzip
}

do_install_tools_arm(){
    apk add curl wget unzip
}
