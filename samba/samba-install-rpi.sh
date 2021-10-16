# Enviroment: Raspberry Pi Jessie
# Preload:
# Commands:
#

echo "============== (Installing eccentials for Samba server) ======================"
sudo apt-get update
sudo apt-get install samba samba-common-bin


echo "============== (Configure the sharing folder with Samba) ======================"
sudo cat>> /etc/samba/smb.conf <<EOF
[NAS]
   comment = NAS External drive
   path = /media/pi
   public = Yes
   browseable = Yes
   writeable = Yes
   valid users=pi
EOF

echo "============== (Add local user & Samba user) ======================"
#sudo groupadd samba -g 6000
#sudo useradd samba1 -u 6000 -g 6000 -s /sbin/nologin -d /dev/null
#sudo smbpasswd -a samba1
sudo smbpasswd -a pi

echo "============== (Restarting Samba server) ======================"
sudo /etc/init.d/samba restart

echo "============== (Samba server is ready to go.) ======================"

