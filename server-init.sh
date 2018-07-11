#! /bin/bash # ---UBUNTU SERVER INITIAL SETUP---
# Notice: 
#    This script should be run by "$ sudo bash xxx.sh"


# Update server & install essentials
yes | sudo apt-get update
yes | sudo apt-get upgrade
yes | sudo apt-get install htop

