#! /bin/bash 
#
# MAINTAINER: Solomon Xie <solomonxiewise@gmail.com>
# Enviroment: Ubuntu
# Notice: 

set -x

REPO_ROOT="https://raw.githubusercontent.com/solomonxie/dotfiles/master"


do_install_seafile(){
    # Load uitility functions (check os)
    curl -fsSL $REPO_ROOT/utils.sh -o $HOME/.bash-utils.sh
    source $HOME/.bash-utils.sh

    # Get Distro
    case distro in
        "ubuntu")
            install_seafile_mysql_ubuntu
            ;;
        "raspbian")
            echo ""
            ;;
    esac
}

install_seafile_mysql_ubuntu(){
    apt-get update
    apt-get install wget 

    # Download seafile package
    wget "http://seafile-downloads.oss-cn-shanghai.aliyuncs.com/seafile-server_6.2.5_x86-64.tar.gz" -P ~/
    mkdir haiwen
    mv seafile-server_* haiwen
    cd haiwen
    tar -xzf seafile-server_*
    mkdir installed
    mv seafile-server_* installed
    
    # Install dependencies
    sudo apt-get install -y python python2.7 libpython2.7 \
        python-setuptools python-imaging python-ldap python-urllib3 \
        ffmpeg python-pip python-mysqldb python-memcache
    sudo pip install pillow moviepy
    
    # Install & Setup Mysql (Prompt for user and password)
    # sudo apt-get -y install mysql-server
    
    # Install Seafile (Prompt for detailed configs)
    cd seafile-server-*
    ./setup-seafile-mysql.sh
    
    # Start Seafile Service
    ./seafile.sh start
    # Start Seahub (web interface)
    ./seahub.sh start 8000
    # Proceed to "http://localhost:8000/"
    
    # Stop seafile
    # ./seahub.sh stop
    # ./seafile.sh stop
    
    # Install Nginx
    # sudo apt-get install -y nginx

    # Setup Nginx as HTTP server for seafile
    sudo mv /etc/nginx/sites-enabled/default /tmp
    sudo curl -fsSL $REPO_ROOT/fileSharing/seafile_nginx.conf -o /etc/nginx/site-available/seafile.conf
    sudo ln -sf /etc/nginx/sites-available/seafile.conf /etc/nginx/sites-enabled/seafile.conf

}