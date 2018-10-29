#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:

set -x

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

    # ipython kernel
    pip install ipykernel
    # Octave Kernel
    pip install metakernel
    pip install octave_kernel
    python -m octave_kernel install
    echo export OCTAVE_EXECUTABLE=$(which octave) >> ~/.zshrc
    # R Kernel
    # has to isntall from R-shell

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
