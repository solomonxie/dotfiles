ubuntu_xrdp:
	sudo apt install -y xrdp
	sudo apt install -y gnome-session-fallback
	echo "gnome-session --session=gnome-fallback" > ~/.xsession
	sudo systemctl restart xrdp
