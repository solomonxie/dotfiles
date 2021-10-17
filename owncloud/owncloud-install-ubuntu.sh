# Enviroment: Raspberry Pi (Raspbian)
# Preload:
# Commands:
#



do_install_owncloud_essentials(){
    echo "========== (Start Installing OwnCloud) ==========="
    sudo apt-get update

    echo "========== (Installing dependencies) ==========="
    sudo apt-get install -y apache2 mariadb-server libapache2-mod-php7.0 \
        openssl php-imagick php7.0-common php7.0-curl php7.0-gd \
        php7.0-imap php7.0-intl php7.0-json php7.0-ldap php7.0-mbstring \
        php7.0-mcrypt php7.0-mysql php7.0-pgsql php-smbclient php-ssh2 \
        php7.0-sqlite3 php7.0-xml php7.0-zip
}

do_download_owncloud(){
    echo "========== (Downloading latest OwnCloud version archive file) ==========="
    # Download the latest version form the webpage: 
    sudo wget https://download.owncloud.org/community/owncloud-10.0.8.tar.bz2
    # Download the related MD5 checksum file:
    sudo wget https://download.owncloud.org/community/owncloud-10.0.8.tar.bz2.md5
    echo "========== (Verifying downloaded file) ==========="
    # Verify the MD5 sum:
    sudo md5sum -c owncloud-10.0.8.tar.bz2.md5 < owncloud-10.0.8.tar.bz2
    # Download the PGP signature:
    sudo wget https://download.owncloud.org/community/owncloud-10.0.8.tar.bz2.asc
    sudo wget https://owncloud.org/owncloud.asc
    # Verify the PGP signature:
    sudo gpg --import owncloud.asc
    sudo gpg --verify owncloud-10.0.8.tar.bz2.asc owncloud-10.0.8.tar.bz2
    echo "========== (Unzip file & move folder to Apache server's root path) ==========="
    # Unarchive the Owncloud package
    sudo tar -xjf owncloud-10.0.8.tar.bz2
    # Copy the folder to Apache Webserver root path
    sudo cp -r owncloud /var/www

}


do_setup_owncloud_apache(){
    echo "===== (Downloading OwnCloud Configuration file to Apache2) ======="
    sudo wget https://github.com/solomonxie/dotfiles/raw/master/ownCloud/owncloud-apache-ubuntu.conf -O /etc/apache2/sites-available/owncloud.conf
    # Then create a symlink to /etc/apache2/sites-enabled:
    sudo ln -s /etc/apache2/sites-available/owncloud.conf /etc/apache2/sites-enabled/owncloud.conf


    # Enable the recommanded modules 
    echo "========== (Enabling Apache server modules) ==========="
    sudo a2enmod rewrite
    sudo a2enmod headers
    sudo a2enmod env
    sudo a2enmod dir
    sudo a2enmod mime 
    # Enable SSL (for https)
    sudo a2enmod ssl
    sudo a2ensite default-ssl
    sudo service apache2 reload
    # Restart Apache
    echo "========== (Restarting Apache server) ==========="
    sudo service apache2 restart

}


do_configure_owncloud(){
    echo "========== (Configure Owncloud Wizard) ==========="
    echo "Please proceed to your web browser and open http://<IP>/owncloud to finish the setup."

    echo "========== (Enable Local External Storage, etc., Hard disk, flash disk) ==========="
    echo "Please add 'files_external_allow_create_new_local' => 'true', to /var/www/owncloud/config/config.php"
    echo "Refresh web browser to see the change."
    # Enable Local External Storage 
    #sudo vim /var/www/owncloud/config/config.php
    # Add this phrase into the array to enable local external storage
    #'files_external_allow_create_new_local' => 'true',

    echo "========== (OwnCloud Installing Finished) ==========="
}



do_install_owncloud_essentials
do_download_owncloud
do_setup_owncloud_apache
do_configure_owncloud
