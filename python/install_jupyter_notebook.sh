#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Preload:
# Commands:

set -x

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

install_kernel_cpp(){
    # Download package for Mac 10.12 (~300MB)
    # Archive page: https://root.cern.ch/download/cling/
    wget https://root.cern.ch/download/cling/cling_2018-11-05_mac1012.tar.bz2
    tar -xvf cling_*.tar.bz2
    mv cling_*.tar.bz2 ~/local/cling
    ln -s ~/local/cling/bin/cling ~/bin/cling
    # Test
    cling --version
    # Install kernel to Jupyter
    source ~/venv-ju/bin/activate
    cd ~/local/cling/share/cling/Jupyter/kernel
    pip install .
    jupyter kernelspec install cling-cpp14

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

do_install_ML_packages
do_install_jupyter_notebook
do_install_jupyter_extensions
do_install_ML_packages