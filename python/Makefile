#######################################################################
#                        PYTHON - make install                        #
#######################################################################

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

debian: checkhealth_debian
	sudo apt install python3 -y
	sudo apt install virtualenv -y
	# Pip
	sudo apt install -y python3-pip python-pip
	# curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
	# sudo python ~/dotfiles/python/get-pip.py

ubuntu: debian
raspbian: debian

python_pip:
	# [ -e $(command -v brew) ] && [ ! -e $(command -v pip) ] && brew install python-pip ||true
	[ -e $(command -v apt-get) ] && [ ! -e $(command -v pip) ] && sudo apt-get install python-pip  ||true
	which pip

venv: python_pip
	[ ! -e $(command -v virtualenv) ] && pip install virtualenv ||true
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
	test -e ~/virtualenv/venv-ju
	curl --version

utils: checkhealth_python
	pip install --user youtube-dl tldr ffmpeg


virtualenv: checkhealth_python
	virtualenv -p python3 ${HOME}/virtualenv/venv
	virtualenv -p python3 ~/virtualenv/venv-ju
	virtualenv -p python2 ${HOME}/virtualenv/venv2

jupyter_notebook: checkhealth_python
	source ~/virtualenv/venv-ju/bin/activate && \
	pip install jupyter && \
	pip install ipykernel && \
	deactivate

jupyter_kernel_octave: checkhealth_python
	# Octave Kernel
	source ~/virtualenv/venv-ju/bin/activate && \
	python -m octave_kernel install && \
	pip install metakernel && \
	pip install octave_kernel && \
	echo export OCTAVE_EXECUTABLE=$(which octave) >> ~/.zshrc && \
	deactivate

jupyter_kernel_r:
jupyter_kernel_c:
jupyter_kernel_cpp:

jupyter_extension: checkhealth_python
	source ~/virtualenv/venv-ju/bin/activate && \
	pip install jupyter_nbextensions_configurator && \
	jupyter nbextensions_configurator enable && \
	pip install jupyter_contrib_nbextensions && \
	jupyter contrib nbextension install && \
	pip install jupyterthemes && \
	deactivate

jupyter_ML: checkhealth_python
	source ~/virtualenv/venv-ju/bin/activate && \
	pip install scikit-learn && \
	pip install numpy && \
	pip install pandas && \
	pip install matplotlib && \
	pip install seaborn scipy && \
	pip install xgboost
	deactivate

jupyter_lab: checkhealth_python
	source ~/virtualenv/venv-ju/bin/activate && \
	pip install jupyterlab && \
	jupyter labextension install @jupyterlab/toc && \
	jupyter labextension install jupyterlab_voyager && \
	jupyter labextension install jupyterlab-drawio && \
	jupyter labextension install pylantern && \
	jupyter serverextension enable --py lantern && \
	deactivate

jupyter: jupyter_notebook jupyter_extension
	@echo 'OK.'
