#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Python on any Unix-like OS
# Description:
#   WsgiDav is a Python implementation for Webadv Server
#   which runs stand-alone without Apache/Nginx servers

do_install_wsgidav(){
    pip install wsgidav cheroot -U
}

run_wsgidav(){
    wsgidav --host=0.0.0.0 --port=8080 --root=~/webdav
}