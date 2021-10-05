#!make
include envfile
include envfile-local

ubuntu_xrdp:
	sudo apt install -y xrdp xubuntu-desktop
	sudo apt install -y xfce4 xubuntu-desktop
	# sudo apt remove unity -y
	echo "xfce4-session" > ~/.xsession
	(echo "xfce4-session" && cat /etc/xrdp/startwn.sh) > /tmp/x/ && sudo mv /tmp/x /etc/xrdp/startwn.sh
	sudo systemctl restart xrdp
