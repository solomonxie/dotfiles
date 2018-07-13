# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#
# ======= Upgrade & Setup Python3 =======
yes | sudo apt-get install python python3
sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
yes | sudo python get-pip.py
yes | sudo pip install --upgrade pip
yes | sudo pip install virtualenv pipenv
