# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#

cd ~/.init

# ---- Upgrade & Setup Python3 ----
yes | sudo apt-get install python3 >> ~/.init/log_python.txt 1>&2

sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py >> ~/.init/log_python.txt 1>&2
yes | sudo python3 get-pip.py >> ~/.init/log_python.txt 1>&2

echo "----[ Upgrading pip ]-----"
yes | pip install --upgrade pip >> ~/.init/log_python.txt 1>&2

echo "----[ Installing virtualenv ]----"
yes | pip install -U virtualenv pipenv >> ~/.init/log_python.txt 1>&2

# ---- Make venvs ----
echo "---[ Settingup virtual environments ]----"
cd ~ && virtualenv -p python3 venv3 >> ~/.init/log_python.txt 1>&2
