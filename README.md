# Overview
Linux/Mac initiate bash scripts, dotfiles.


## How to use
Fetch and run `init.sh` to initialize a local linux/mac machine:
```sh
$ git clone https://github.com/solomonxie/dotfiles.git
$ cd ./cdn
$ sudo ./init.sh >> /var/log/sys_init.log
```

or fetch individual script to install/setup programs:
```sh
$ curl -L https://raw.githubusercontent.com/solomonxie/cdn/master/vim/install_vim.sh | sudo sh
```
