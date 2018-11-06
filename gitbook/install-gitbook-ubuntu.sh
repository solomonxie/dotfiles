#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# Notice: 


do_install_gitbook_docker(){
    docker pull billryan/gitbook
    alias gitbook='docker run -it --rm -v "$PWD":/gitbook -p 4000:4000  --name gitbook billryan/gitbook gitbook'
}

do_install_gitbook_manually(){
    npm i npm@latest -g
    npm install gitbook-cli -g -d
}

do_setup_gitbook(){
    wget $REPO_ROOT//gitbook/book.json
    wget $REPO_ROOT//gitbook/SUMMARY.json
    wget $REPO_ROOT//gitbook/README.json

    gitbook init
    gitbook install
}