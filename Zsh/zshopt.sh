#!/bin/bash

# Zshopt is licensed under The MIT License.
# A copy of this license was provived in the repo www.github.com/larz258/Zshopt as LICENSE.
#
# Github repo: https://github.com/larz258/Zshopt
# 
# This script allows you to use the 'shopt' command in zsh (or other bash like shells).
# To use this, simply add the 'shopt' script to a location on your $PATH
# (I suggest /usr/bin) or add the following line to your .zshrc
# alias shopt='/path/to/shopt'
# 
# If you don't have a .zshrc you can use the one provided in this repo
# or you can append the .zshrc in this repo to your existing .zshrc.
# $ cat .zshrc >> ~/.zshrc
# or
# include this in ~/.zshrc: alias shopt='/usr/bin/shopt'
# 
# (Note the included .zshrc assumes that you put the 'shopt' script in /usr/bin.

args='';
for item in $@
  do
    args="$args $item";
  done
shopt $args;
