# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#

do_install_python3(){
    # ---- Upgrade & Setup Python3 ----
    yes | sudo apt-get install python3

}

do_install_pip(){
    echo "----[ Installing pip ]-----"
    sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    yes | sudo python3 get-pip.py

    echo "----[ Upgrading pip ]-----"
    yes | pip install --upgrade pip

    mkdir ~/.pip
    wget https://raw.githubusercontent.com/solomonxie/cdn/master/python/pip.conf -O ~/.pip/pip.conf
}

do_install_virtualenv(){
    echo "----[ Installing virtualenv ]----"
    yes | pip install -U virtualenv pipenv

    # ---- Make venvs ----
    echo "---[ Settingup virtual environments ]----"
    virtualenv -p python3 ~/venv3
}


do_install_python3
do_install_pip
do_install_virtualenv