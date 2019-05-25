DOTFILES ?= ~/dotfiles
MYOS ?= `cat /tmp/env-os`
USER ?= `cat /tmp/env-user`

checkhealth_mac:
	brew --version
	curl --version
	python3 -V
	pip -V

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
	sudo apt-get install python3 -y
	sudo apt-get install virtualenv -y
	sudo apt-get install -y python-pip python3-pip

ubuntu: debian
raspbian: debian


checkhealth_virtualenv:
	pip --version
	virtualenv --version

virtualenv: checkhealth_virtualenv
	virtualenv -p python3 $(HOME)/virtualenv/venv3
	virtualenv -p python2 $(HOME)/virtualenv/venv2
	virtualenv -p python3 ~/virtualenv/venv-ju

checkhealth_jupyter:
	pip --version
	virtualenv --version
	test -e ~/virtualenv/venv-ju


jupyter_notebook: checkhealth_jupyter
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

jupyter_extension: checkhealth_jupyter
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

jupyter_ML: checkhealth_jupyter
	source ~/virtualenv/venv-ju/bin/activate
	pip install scikit-learn
	pip install numpy
	pip install pandas
	pip install matplotlib
	pip install seaborn scipy
	pip install xgboost
	deactivate

jupyter_lab: checkhealth_jupyter
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

jupyter: jupyter_notebook jupyter_extension
