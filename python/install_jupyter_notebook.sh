# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:

do_install_ML_packages(){
    source ~/venv-ju/bin/activate

    # Packages for ML
    pip install scikit-learn
    pip install numpy
    pip install pandas
    pip install matplotlib
    pip install seaborn scipy
    pip install xgboost

    deactivate
}

do_install_jupyter_notebook(){
    virtualenv -p python3 ~/venv-ju
    source ~/venv-ju/bin/activate

    pip install ipykernel

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
