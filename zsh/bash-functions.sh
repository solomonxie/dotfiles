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

# Extracts any archive(s) (if unp isn't installed)
decompress () {
    for archive in $*; do
        if [ -f $archive ] ; then
            case $archive in
                *.tar.bz2)   tar xvjf $archive    ;;
                *.tar.gz)    tar xvzf $archive    ;;
                *.bz2)       bunzip2 $archive     ;;
                *.rar)       rar x $archive       ;;
                *.gz)        gunzip $archive      ;;
                *.tar)       tar xvf $archive     ;;
                *.tbz2)      tar xvjf $archive    ;;
                *.tgz)       tar xvzf $archive    ;;
                *.zip)       unzip $archive       ;;
                *.Z)         uncompress $archive  ;;
                *.7z)        7z x $archive        ;;
                *)           echo "don't know how to extract '$archive'..." ;;
            esac
        else
            echo "'$archive' is not a valid file!"
        fi
    done
}


# Make a virtualenv
make_venv() {
    gitroot="$(git rev-parse --show-toplevel)"
    [[ ! -e "$gitroot" ]] && echo "Not in a git repo"
    requirements_path="$gitroot/requirements.txt"
    [[ ! -e "$requirements_path" ]] && echo "No requirements.txt found"
    mkdir -p ~/virtualenv/ ||true
    venv_path="$(realpath ~/virtualenv/venv-$(basename $PWD))"
    py_exe="$venv_path/bin/python"
    python3 -m virtualenv -p python3 $venv_path
    $py_exe -m pip install -r $requirements_path
    ln -sf $py_exe .git/python3_symblink
}
