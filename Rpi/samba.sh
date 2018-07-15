# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Enviroment: Raspberry Pi Jessie
# Preload:
# Commands:
#

echo "============== (Installing eccentials for Samba server) ======================"
sudo apt-get update
sudo apt-get install samba samba-common-bin



echo "============== (Configure the sharing folder with Samba) ======================"
sudo mkdir -m 1777 /home/pi/share
sudo cat> /etc/samba/smb.conf <<EOF
[share]
Comment = Pi shared folder
Path = /home/pi/share
Browseable = yes
Writeable = Yes
only guest = no
create mask = 0777
directory mask = 0777
Public = yes
Guest ok = yes
EOF

echo "============== (Add local user & Samba user) ======================"
sudo groupadd samba -g 6000
sudo useradd samba1 -u 6000 -g 6000 -s /sbin/nologin -d /dev/null
sudo smbpasswd -a samba1

echo "============== (Restarting Samba server) ======================"
sudo /etc/init.d/samba restart

echo "============== (Installment of Samba server finished.) ======================"

