#!/usr/bin/env sh
######################################################
#                ____            _                   #
#               | __ )  __ _ ___| |__                #
#               |  _ \ / _` / __| '_ \               #
#               | |_) | (_| \__ \ | | |              #
#               |____/ \__,_|___/_| |_|              #
#                                                    #
######################################################

kgrep(){
    keywords=$1
    pids="$(ps aux |grep $keywords |grep -v grep |awk '{print $2}' |xargs)"
    echo "[$keywords]: $pids"
    [[ $pids == "" ]] && return 0
    echo "Kill above processes? (y/n) "
    read answer
    [[ $answer == "y" ]] && echo $pids |xargs kill -9
}


sslo(){
    pkill ss-local
    nohup ss-local -c $1 -v 1> /tmp/ssclient.log 2> /tmp/ssclient-err.log &
}
