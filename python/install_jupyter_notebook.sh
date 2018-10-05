# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:

do_install_jupyter_notebook(){

}

do_setup_virtualenv(){
    virtualenv -p python3 ~/venv-ju
    source ~/venv-ju/bin/activate

    pip install ipykernel -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
    pip install numpy -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
    pip install pandas -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
    pip install matplotlib -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
    pip install seaborn scipy  -i http://pypi.douban.com/simple --trusted-host pypi.douban.com

    deactivate
}