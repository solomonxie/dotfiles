# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#
# ======= Upgrade & Setup Python3 =======
yes | sudo apt-get install python python3
sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
yes | sudo python get-pip.py
echo "========= Upgrading Python ==========="
yes | sudo pip install --upgrade pip
echo "======== Installing virtualenv ========"
yes | sudo pip install virtualenv pipenv

# ======= Make venvs =========
echo "======= Settingup virtual environments ======="
cd ~ && virtualenv -p python3 venv3
