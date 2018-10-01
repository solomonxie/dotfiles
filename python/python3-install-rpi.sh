# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#

# ---- Upgrade & Setup Python3 ----
yes | sudo apt-get install python3

sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
yes | sudo python3 get-pip.py

echo "----[ Upgrading pip ]-----"
yes | pip install --upgrade pip

echo "----[ Installing virtualenv ]----"
yes | pip install -U virtualenv pipenv

# ---- Make venvs ----
echo "---[ Settingup virtual environments ]----"
cd ~ && virtualenv -p python3 venv3
