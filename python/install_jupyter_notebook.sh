# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:

do_install_ML_packages(){
    source ~/venv-ju/bin/activate

    # Packages for ML
    pip install scikit-learn -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
    pip install numpy -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
    pip install pandas -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
    pip install matplotlib -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
    pip install seaborn scipy  -i http://pypi.douban.com/simple --trusted-host pypi.douban.com

    deactivate
}

do_install_jupyter_notebook(){
    virtualenv -p python3 ~/venv-ju
    source ~/venv-ju/bin/activate

    pip install ipykernel -i http://pypi.douban.com/simple --trusted-host pypi.douban.com

    deactivate
}

do_install_jupyter_extensions(){
    source ~/venv-ju/bin/activate

    # Configurator
    pip install jupyter_nbextensions_configurator
    jupyter nbextensions_configurator enable

    # Extensions pack
    pip install jupyter_contrib_nbextensions
    jupyter contrib nbextension install


    # Themes for jupyter notebook
    pip install jupyterthemes

    deactivate
}

do_install_ML_packages
do_install_jupyter_notebook
do_install_jupyter_extensions
