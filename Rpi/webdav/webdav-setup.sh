# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#
# =======SETING UP Webdav server =======

echo "===== (Installing Apache2) ======="
sudo apt-get install  -y apache2

echo "===== (Enable Webdav module support from Apache2) ======="
cd ~
sudo a2enmod dav
sudo a2enmod dav_fs

# 创建共享目录并修改权限
echo "===== (Make directories for Webdav sharing) ======="
sudo mkdir -p ~/webdav
sudo chown -R www-data:www-data  ~/webdav

# 创建WebDav的访问用户数据库，顺便创建用户`pi` (需要手动交互 输入密码)
echo "===== (Create user 'pi' for Webdav access ---manual password input required) ======="
sudo htpasswd -c /etc/apache2/webdav.password pi
#echo "===== (Create user 'guest' for Webdav access ---manual password input required) ======="
#sudo htpasswd /etc/apache2/webdav.password guest

echo "===== (Change file permission of webdav password file) ======="
sudo chown root:www-data /etc/apache2/webdav.password
sudo chmod 640 /etc/apache2/webdav.password

echo "===== (Downloading Webdav Configuration file to Apache2) ======="
sudo wget https://github.com/solomonxie/cdn/raw/master/Rpi/webdav/webdav-apache.conf -O /etc/apache2/sites-available/webdav-apache.conf

# 重启Apache2服务器
echo "===== (Restarting Apache2 server) ======="
sudo systemctl restart apache2
# 或
#sudo /etc/init.d/apache2 reload
