#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: 
# Description:

install_s3fs_ubuntu(){
    # https://cloud.netapp.com/blog/amazon-s3-as-a-file-system
    # AWS S3 Auth info
    BUCKET_NAME=''
    ACCESS_KEY=''
    SECRET_KEY=''
    # Install
    sudo apt-get install -y s3fs
    # Change key pairs to yours
    echo $ACCESS_KEY:$SECRET_KEY > ~/.passwd-s3fs
    chmod 600 ~/.passwd-s3fs
    # Mount the aws S3 bucket
    mkdir ~/s3-drive
    /usr/bin/s3fs $BUCKET_NAME ~/s3-drive -o passwd_file=~/.passwd-s3fs -o umask=0007,uid=$(id -u),gid=$(id -g)
    # Debugging mode
    # /usr/bin/s3fs Your-Bucket-Name ~/s3-drive -o dbglevel=info -f -o curldbg
    # Show all the mounted devices
    mount
    sudo ls ~/s3-drive
}

install_s3fs_mac(){
    # AWS S3 Auth info
    BUCKET_NAME=''
    ACCESS_KEY=''
    SECRET_KEY=''
    # Install
    sudo brew cask install osxfuse
    brew install s3fs
    # Custom
    # sudo /bin/cp -rfX /usr/local/Cellar/fuse4x-kext/0.9.2/Library/Extensions/fuse4x.kext /Library/Extensions
    # sudo chmod +s /Library/Extensions/fuse4x.kext/Support/load_fuse4x
    # Change key pairs to yours
    echo $ACCESS_KEY:$SECRET_KEY > ~/.passwd-s3fs
    chmod 600 ~/.passwd-s3fs
    # Mount the aws S3 bucket
    mkdir ~/s3-drive
    /usr/local/bin/s3fs $BUCKET_NAME ~/s3-drive -o passwd_file=~/.passwd-s3fs -o umask=0007,uid=$(id -u),gid=$(id -g)
    # Debugging mode
    # /usr/bin/s3fs Your-Bucket-Name ~/s3-drive -o dbglevel=info -f -o curldbg
    # Show all the mounted devices
    mount
    sudo ls ~/s3-drive
}