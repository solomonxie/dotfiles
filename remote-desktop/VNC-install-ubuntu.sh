# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#

# ======= Set up VNC desktop =======
echo "========== (Installing VNC and dependencies) ==========="
sudo apt install xfce4 xfce4-goodies tightvncserver -y

echo "========== (Start VNC server) ==========="
sudo tightvncserver
