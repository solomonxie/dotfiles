# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com

checkenv_python3(){
    echo "Checking envorionment for python3"
}


apt_get(){
    $app=$1
    echo $app
    sudo apt-get install $app

    if [$? != 0];then
        echo "[Failed] Couldn't install $app"
        return 0
    fi
    return 1
}