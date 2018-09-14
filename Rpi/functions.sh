# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com

checkenv_python3(){
    echo "Checking envorionment for python3"
}


apt_get(){
    $app=$1
    echo "Command  >>>>  sudo apt-get install $1"
    sudo apt-get install $1

    if [$? != 0];then
        echo "[  Failed  ] Couldn't install $1"
        return 0
    fi
    return 1
}