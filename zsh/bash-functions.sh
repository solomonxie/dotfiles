#!/usr/bin/env sh
######################################################
#                ____            _                   #
#               | __ )  __ _ ___| |__                #
#               |  _ \ / _` / __| '_ \               #
#               | |_) | (_| \__ \ | | |              #
#               |____/ \__,_|___/_| |_|              #
#                                                    #
######################################################

kgrep() {
    keywords=$1
    pids="$(ps aux |grep $keywords |grep -v grep |awk '{print $2}' |xargs)"
    echo "[$keywords]: $pids"
    [[ $pids == "" ]] && return 0
    echo "Kill above processes? (y/n) "
    read answer
    [[ $answer == "y" ]] && echo $pids |xargs kill -9
}


sslo() {
    pkill ss-local
    nohup ss-local -c $1 -v 1> /tmp/ssclient.log 2> /tmp/ssclient-err.log &
}

# create .tar.gz
targz() { tar -zcvf $1.tar.gz $1; rm -r $1; }
# extra .tar.gz
untargz() { tar -zxvf $1; rm -r $1; }

split_video() {
    # Split video (without conversion)
    #    $ ffmpeg -i FILE -ss START -t DURATION -vcodec copy -acodec copy OUTPUT
    file=$1
    start=$2
    duration=$3
}

mp4_to_mp3() {
    # $ ffmpeg -i INPUT.mp4 OUTPUT.mp3
    file=$1
}

extract_pdf() {
    file=$1
    pages=$2
    pdftk $file cat $pages output combined.pdf
}
