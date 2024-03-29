#! /usr/bin/env bash
#
# ENVIRONMENT: MAC / UBUNTU
# Preload:
# Commands:

# Read environment variables
if [ ! -e /tmp/env-os -a -e /tmp/env-user ]; then
    echo "Please run './configure' before installment."
    exit 1;
else
    export MYOS=`cat /tmp/env-os`
    export USER=`cat /tmp/env-user`
fi

do_install_jupyter_notebook(){
    virtualenv -p python3 ~/virtualenv/venv-ju
    source ~/virtualenv/venv-ju/bin/activate

    # ipython kernel
    pip install jupyter
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
    source ~/virtualenv/venv-ju/bin/activate

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
    source ~/virtualenv/venv-ju/bin/activate

    # Packages for ML
    pip install scikit-learn
    pip install numpy
    pip install pandas
    pip install matplotlib
    pip install seaborn scipy
    pip install xgboost

    deactivate
}

install_kernel_cpp(){
    # Not working yet!!
    #
    # Download package for Mac 10.12 (~300MB)
    # Archive page: https://root.cern.ch/download/cling/
    wget https://root.cern.ch/download/cling/cling_2018-11-05_mac1012.tar.bz2
    tar -xvf cling_*.tar.bz2
    find . -type d -name "cling_*" -exec mv -v {} ./cling
    mv cling_*.tar.bz2 ./cling/
    mv cling ~/.local/
    ln -s ~/.local/cling/bin/cling /usr/local/bin/cling
    # Test
    cling --version
    # Install kernel to Jupyter
    source ~/virtualenv/venv-ju/bin/activate
    cd ~/.local/cling/share/cling/Jupyter/kernel
    pip install .
    jupyter kernelspec install cling-cpp14

    cd - ; deactivate
}


install_jupyter_lab(){
    source ~/virtualenv/venv-ju/bin/activate

    pip install jupyterlab
    # Install extensions
    # 目录结构显示
    jupyter labextension install @jupyterlab/toc
    # Voyager 数据优化浏览
    jupyter labextension install jupyterlab_voyager
    # Drawio 画流程图
    jupyter labextension install jupyterlab-drawio
    # Lantern数据绘图加强
    jupyter labextension install pylantern
    jupyter serverextension enable --py lantern

    deactivate
}


# Entry point
do_install_jupyter_notebook
do_install_jupyter_extensions
do_install_ML_packages
