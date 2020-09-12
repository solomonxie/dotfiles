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


extension() {
    # https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
    INPUT=$1
    EXTENSION="${INPUT##*.}"
    echo $EXTENSION
}


splitvideo() {
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


downloadplaylist() {
    URL=$1
    OUTPUT=${2:-output.mp4}
    ffmpeg -i $URL -c copy $OUTPUT
}


tomp3() {
    # $ ffmpeg -i INPUT.mp4 OUTPUT.mp3
    INPUT=$1
    ffmpeg -i $INPUT "${INPUT%.*}.mp3"
}


tomp4() {
    INPUT=$1
    now="$(date -u +'%Y%m%d%H%M%S')"
    if [[ -f "$INPUT" ]]; then
        target="${INPUT%.*}_${now}.mp4"
        # ffmpeg -i $INPUT -codec copy "${INPUT%.*}.mp4"
        ffmpeg -i $INPUT -codec:a aac -b:a 128k -codec:v libx264 -crf 23 "$target"
    elif [[ -d "$INPUT" ]]; then
        for f in $(find "$INPUT" -type f); do
            target="${f%.*}_${now}.mp4"
            ffmpeg -i $f -codec:a aac -b:a 128k -codec:v libx264 -crf 23 "$target"
        done
    fi
}


extractpdf() {
    # Example:
    INPUT=$1
    PAGES=$2
    pdftk $INPUT cat $PAGES output "${INPUT%.*}_combined.pdf"
}


decompress () {
    # Extracts any archive(s) (if unp isn't installed)
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


makevenv() {
    # Make a virtualenv
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
