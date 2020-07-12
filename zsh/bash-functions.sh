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

extension() {
    # https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
    INPUT=$1
    EXTENSION="${INPUT##*.}"
    echo $EXTENSION
}

split_video() {
    # Split video (without conversion)
    #    $ ffmpeg -i INPUTT -ss mm:ss -to mm:ss -vcodec copy -acodec copy OUTPUT
    INPUT=$1
    START=$2
    END=$3
    FILENAME="${$(basename $INPUT)%.*}"
    FILEPATH="${INPUT%.*}"
    EXTENSION="${INPUT##*.}"
    ffmpeg -i $INPUT -ss $START -to $END -vcodec copy -acodec copy "${FILEPATH}__clip_${START/:/-}_${END/:/-}.${EXTENSION}"
}

extract_mp3() {
    # $ ffmpeg -i INPUT.mp4 OUTPUT.mp3
    INPUT=$1
    ffmpeg -i $INPUT "${INPUT%.*}.mp3"
}

download_playlist() {
    URL=$1
    OUTPUT=${2:-output.mp4}
    ffmpeg -i $URL -c copy $OUTPUT
}

mkv_to_mp4() {
    INPUT=$1
    ffmpeg -i $INPUT -codec copy "${INPUT%.*}.mp4"
}

extract_pdf() {
    # Example:
    INPUT=$1
    PAGES=$2
    pdftk $INPUT cat $PAGES output "${INPUT%.*}_combined.pdf"
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


slug() {
    INPUT=$1
    echo $INPUT |sed "s/[()\!]//g" |sed "s/[. ]/-/g"
}
