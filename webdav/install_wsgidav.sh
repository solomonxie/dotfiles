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
    # Without config file (current user, empty password)
    wsgidav --no-config --host=0.0.0.0 --port=8080 --root=~/webdav
    # With config file
    wsgidav --config=my_config.yaml
}

install_s3fs_ubuntu(){
    # https://cloud.netapp.com/blog/amazon-s3-as-a-file-system
    sudo apt-get install -y s3fs
    # Change key pairs to yours
    echo ACCESS_KEY:SECRET_KEY > ~/.passwd-s3fs
    chmod 600 ~/.passwd-s3fs
    # Mount the aws S3 bucket
    mkdir ~/s3-drive
    /usr/bin/s3fs Your-Bucket-Name ~/s3-drive -o umask=0007,uid=1000,gid=1000
    # Debugging mode
    # /usr/bin/s3fs Your-Bucket-Name ~/s3-drive -o dbglevel=info -f -o curldbg
    # Show all the mounted devices
    mount
    sudo ls ~/s3-drive
}