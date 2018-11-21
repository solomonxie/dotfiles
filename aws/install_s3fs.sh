#! /bin/bash 
#
# MAINTINAER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: 
# Description:


set -x


do_install_s3fs(){
    if [ "$1" = "--distro" ];then
        distro="$2"
    fi
    case $distro in
        "ubuntu")
            install_s3fs_ubuntu ;;
        "mac")
            install_s3fs_mac ;;
    esac
}


install_s3fs_ubuntu(){
    sudo apt-get install -y s3fs
}

install_s3fs_mac(){
    sudo brew cask install osxfuse
    brew install s3fs
    # Custom
    # sudo /bin/cp -rfX /usr/local/Cellar/fuse4x-kext/0.9.2/Library/Extensions/fuse4x.kext /Library/Extensions
    # sudo chmod +s /Library/Extensions/fuse4x.kext/Support/load_fuse4x
}

mount_s3_bucket(){
    # https://cloud.netapp.com/blog/amazon-s3-as-a-file-system
    # AWS S3 Auth info
    BUCKET_NAME=''
    ACCESS_KEY=''
    SECRET_KEY=''
    # Change key pairs to yours
    echo $ACCESS_KEY:$SECRET_KEY > ~/.s3Auth
    chmod 600 ~/.s3Auth
    # Mount the aws S3 bucket
    mkdir ~/s3drive
    /usr/local/bin/s3fs $BUCKET_NAME ~/s3drive -o passwd_file=~/.s3Auth -o umask=0007,uid=$(id -u),gid=$(id -g)
    # Debugging mode
    # /usr/bin/s3fs Your-Bucket-Name ~/s3drive -o dbglevel=info -f -o curldbg
    # Show all the mounted devices
    mount
    sudo ls ~/s3drive
}


do_install_s3fs $1 $2