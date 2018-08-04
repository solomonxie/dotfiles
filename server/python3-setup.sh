# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:
#
# ======= Upgrade & Setup Python3 =======
yes | sudo apt-get install python3
if [$? != 0];then
    echo "======Failed on installing Python3======="
    exit 1;
fi
sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
yes | sudo python3 get-pip.py
if [$? != 0];then
    echo "======Failed on installing pip======="
    exit 1;
fi
echo "========= Upgrading pip ==========="
yes | sudo pip install --upgrade pip
if [$? != 0];then
    echo "======Failed on upgrading pip======="
    exit 1;
fi
echo "======== Installing virtualenv ========"
yes | sudo pip install virtualenv pipenv
if [$? != 0];then
    echo "======Failed on installing virtualenv======="
    exit 1;
fi

# ======= Make venvs =========
echo "======= Settingup virtual environments ======="
cd ~ && virtualenv -p python3 venv3
if [$? != 0];then
    echo "======Failed on creating virtualenv======="
    exit 1;
fi
