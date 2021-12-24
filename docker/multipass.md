# Multipass

```sh
$ brew cask install multipass
$ multipass launch -c 2 -m 2G -d 10G -n myvm
$ multipass mount /tmp/workspace/ myvm
$ multipass mount $(realpath ~/.ssh) myvm
$ multipass shell myvm

(myvm) $ sudo su root
(myvm) $ apt update
(myvm) $ apt install python3 python3-pip
(myvm) $ apt install docker docker.io
(myvm) $ pip install docker-compose
```
