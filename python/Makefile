#######################################################################
#                        PYTHON - make install                        #
#######################################################################
-include envfile
-include envfile-local

DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`

# This recipe is for solo-installment, not for "parent" Makefile
install:
	$(MAKE) ${MYOS}

checkhealth_mac:
	brew --version

checkhealth_debian:
	apt-get --version

mac: checkhealth_mac
	brew install python3
	# Pip
	curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
	sudo python3 /tmp/get-pip.py
	# Virtualenv
	pip3 install virtualenv --user


# FOR Mac (M1 Chip, Apple Silicon) Only:
mac_m1:
	arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	arch -x86_64 /usr/local/bin/brew install python@3.7
	python3.7 -m pip install pip --upgrade
	python3.7 -m pip install virtualenv


debian: checkhealth_debian
	cat ~/dotfiles/pacman/aptfile-raspbian.txt |xargs sudo apt-get install -y

ubuntu: debian
raspbian: debian


venv:
	python3 -m pip install virtualenv
	python3 -m virtualenv ~/virtualenv/venv

venv-full:
	[ -e $(command -v apt) ] && [ ! -e $(command -v pip3) ] && sudo apt install -y python3-pip  ||true
	[ ! -e $(command -v virtualenv) ] && pip3 install virtualenv ||true
	# Py2 (must be in the front to be covered by py2 later)
	[ ! -e ~/virtualenv/venv2/bin/python2 ] && virtualenv -p python2 ~/virtualenv/venv2/ ||true
	if ! grep -q "${HOME}/virtualenv/venv/bin/python2" <<< ${PATH};then echo "export PATH=\"${HOME}/virtualenv/venv2/bin:$PATH\"" |tee >> ~/.zshrc ~/.bashrc; fi
	# Py3
	[ ! -e ~/virtualenv/venv/bin/python ] && virtualenv -p python3 ~/virtualenv/venv/ ||true
	if ! grep -q "${HOME}/virtualenv/venv/bin/python3" <<< ${PATH};then echo "export PATH=\"${HOME}/virtualenv/venv/bin:$PATH\"" |tee >> ~/.zshrc ~/.bashrc; fi
	~/virtualenv/venv/bin/pip install --upgrade -r ~/dotfiles/python/requirements.txt
	@echo [ OK ]


checkhealth_python:
	python3 -V
	pip --version
	virtualenv --version
	curl --version

utils:
	pip install --user youtube-dl tldr ffmpeg


virtualenv:
	# virtualenv -p python3 ${HOME}/virtualenv/venv
	virtualenv -p python3 ~/virtualenv/venv-ju
	# virtualenv -p python2 ${HOME}/virtualenv/venv2



#######################################################################
#                               JUPYTER                               #
#######################################################################
venv-ju:
	virtualenv -p python3 ~/virtualenv/conda

jupyter-notebook:
	pip install jupyter
	pip install ipykernel

jupyter-extention:
	# EXTENTIONS
	pip install jupyter_nbextensions_configurator
	jupyter nbextensions_configurator enable
	pip install jupyter_contrib_nbextensions
	jupyter contrib nbextension install
	pip install jupyterthemes

jupyter-octave:
	# Octave Kernel
	python -m octave_kernel install
	pip install metakernel
	pip install octave_kernel
	echo export OCTAVE_EXECUTABLE=$(which octave) >> ~/.zshrc

# jupyter_kernel_r:
# jupyter_kernel_c:
# jupyter_kernel_cpp:

jupyter-ml:
	pip install scikit-learn
	pip install numpy
	pip install pandas
	pip install matplotlib
	pip install seaborn scipy
	pip install xgboost

jupyter-lab:
	pip install jupyterlab
	jupyter labextension install @jupyterlab/toc
	jupyter labextension install jupyterlab_voyager
	jupyter labextension install jupyterlab-drawio
	jupyter labextension install pylantern
	jupyter serverextension enable --py lantern

jupyter: jupyter-notebook jupyter-extension
	@echo 'OK.'

jupyter-start:
	jupyter notebook
