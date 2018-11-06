# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#
# =======SETING UP Webdav server =======

echo "===== (Installing Apache2) ======="
yes | sudo apt-get install apache2

echo "===== (Enable Webdav module support from Apache2) ======="
cd ~
sudo a2enmod dav
sudo a2enmod dav_fs

# 创建共享目录并修改权限
echo "===== (Make directories for Webdav sharing) ======="
sudo mkdir -p /var/www/webdav
sudo chown -R www-data:www-data  /var/www/webdav

# 创建WebDav的访问用户数据库，顺便创建用户`ubuntu` 密码123
echo "===== (Create user 'ubuntu' for Webdav access ---manual password input required) ======="
sudo htpasswd -c /etc/apache2/webdav.password ubuntu 123
#echo "===== (Create user 'guest' for Webdav access) ======="
sudo htpasswd /etc/apache2/webdav.password guest 123

echo "===== (Change file permission of webdav password file) ======="
sudo chown root:www-data /etc/apache2/webdav.password
sudo chmod 640 /etc/apache2/webdav.password

echo "===== (Downloading Webdav Configuration file to Apache2) ======="
sudo wget https://github.com/solomonxie/dotfiles/raw/master/webdav/webdav-apache-ubuntu.conf -O /etc/apache2/sites-available/webdav-apache.conf
sudo ln -sf /etc/apache2/sites-available/webdav-apache.conf /etc/apache2/sites-enabled/webdav-apache.conf

# 重启Apache2服务器
echo "===== (Restarting Apache2 server) ======="
sudo /etc/init.d/apache2 reload
# 或
#sudo systemctl restart apache2
