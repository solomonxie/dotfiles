#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Ubuntu
# Notice: 


do_install_gitbook_docker(){
    docker pull billryan/gitbook
    alias gitbook='docker run --rm -v "$PWD":/gitbook -p 4000:4000 billryan/gitbook gitbook'
}

do_install_gitbook_manually(){
    npm i npm@latest -g
    npm install gitbook-cli -g -d
}

do_setup_gitbook(){
    wget https://raw.githubusercontent.com/solomonxie/cdn/master/gitbook/book.json
    wget https://raw.githubusercontent.com/solomonxie/cdn/master/gitbook/SUMMARY.json
    wget https://raw.githubusercontent.com/solomonxie/cdn/master/gitbook/README.json

    gitbook init
    gitbook install
}