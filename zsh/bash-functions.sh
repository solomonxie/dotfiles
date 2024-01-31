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
    local keywords pids
    keywords=$1
    if [[ -z "$keywords" ]];then
        echo "ERROR: MISSING PROCESS NAME..."
        return 128
    fi
    pids="$(ps aux |grep $keywords |grep -v grep |awk '{print $2}' |xargs)"
    echo "[$keywords]: $pids"
    [[ $pids == "" ]] && return 0
    echo "Kill above processes? (y/n) "
    read answer
    [[ $answer == "y" ]] && echo $pids |xargs kill -9
}
alias pskill=kgrep

port2proc() {
    local port
    port=$1
    lsof -i :$port |awk '{print $2}' |tail -n +2
}


sslo() {
    pkill ss-local
    nohup ss-local -c $1 -v 1> /tmp/ssclient.log 2> /tmp/ssclient-err.log &
}


extension() {
    local INPUT EXTENSION
    # https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
    INPUT=$1
    EXTENSION="${INPUT##*.}"
    echo $EXTENSION
}


splitvideo() {
    # Split video (without conversion)
    #    $ ffmpeg -i INPUTT -ss mm:ss -to mm:ss -vcodec copy -acodec copy OUTPUT
    local INPUT START END FILENAME FILEPATH EXTENSION
    INPUT=$1
    START=$2
    END=$3
    FILENAME="${$(basename $INPUT)%.*}"
    FILEPATH="${INPUT%.*}"
    EXTENSION="${INPUT##*.}"
    ffmpeg -i $INPUT -ss $START -to $END -vcodec copy -acodec copy "${FILEPATH}__clip_${START/:/-}_${END/:/-}.${EXTENSION}"
}


downloadplaylist() {
    local URL OUTPUT
    URL=$1
    OUTPUT=${2:-output.mp4}
    ffmpeg -i $URL -c copy $OUTPUT
}


tomp3() {
    local INPUT
    # $ ffmpeg -i INPUT.mp4 OUTPUT.mp3
    INPUT=$1
    ffmpeg -i $INPUT "${INPUT%.*}.mp3"
}


tomp4() {
    local INPUT THREADS now target
    INPUT=$1
    # TARGET=$2
    THREADS=${2:-"2"}
    now="$(date -u +'%Y%m%d%H%M%S')"
    if [[ -f "$INPUT" ]]; then
        target="${INPUT%.*}_${now}.mp4"
        # ffmpeg -i $INPUT -codec copy "${INPUT%.*}.mp4"
        ffmpeg -i $INPUT -codec:a aac -b:a 128k -codec:v libx264 -crf 23 -threads $THREADS "$target"
    elif [[ -d "$INPUT" ]]; then
        for f in $(find "$INPUT" -type f); do
            target="${f%.*}_${now}.mp4"
            ffmpeg -i $f -codec:a aac -b:a 128k -codec:v libx264 -crf 23 -threads $THREADS "$target"
        done
    fi
}


mergemp4() {
    local params input INPUT1 INPUT2
    params=""
    INPUT1="$1"
    INPUT2="$2"
    # INPUT2="${2:-${INPUT1%.*}.m4a}"
    for input in $*;do
        if [[ -f "$input" ]];then
            params="$params -i \"$input\" "
        else
            echo "Not exists: $input"
        fi
    done
    sh -c "ffmpeg $params -acodec copy -vcodec copy ${INPUT1%.*}_combined.mp4 "
}


mergemp4audio() {
    local INPUT
    INPUT1="$1"
    for ext in "m4a" "webm" "mp3";do
        INPUT2="${2:-${INPUT1%.*}.${ext}}"
        if [[ -f $INPUT2 ]];then break; fi
    done
    if [[ ! -f $INPUT2 ]];then
        echo "No relative audio file found for: $INPUT1"
        exit 1
    fi
    ffmpeg -i $INPUT1 -i $INPUT2 -acodec copy -vcodec copy "${INPUT1%.*}_combined.mp4"
}



mergesubtitle() {
    local INPUT SUB DELAY OFFSET
    INPUT=$1
    SUB=$2
    DELAY=${3:-0}
    OFFSET=${4:-0}
    # echo ffmpeg -itoffset $OFFSET -i "$SUB" -c copy "/tmp/subtmp$OFFSET"
    # echo ffmpeg -i "$INPUT" -vf "subtitles=/tmp/subtmp/$OFFSET":force_style='Alignment=95'" "${INPUT%.*}_sub.mp4"
}


extractpdf() {
    local INPUT PAGES
    # Example:
    INPUT=$1
    PAGES=$2
    pdftk $INPUT cat $PAGES output "${INPUT%.*}_combined.pdf"
}


decompress () {
    local archive
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
    local gitroot requirements_path venv_path py_exe
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
    local s=$1
    echo $s |sed "s/[()\!]//g" |sed "s/[. ]/-/g"
}

sed_all() {
    # For your reference only:
    for f in $(fd .py); do
        sed -i '/matched_word_of_line/ c\ a_whole_new_line/'
        sed -i 's/old_word/new_word/'
    done
}


cheat() {
    local keyword=$1
    curl "https://cheat.sh/$keyword"
}

venv() {
    local name=$1
    source "$HOME/virtualenv/$name/bin/activate"
}

find_and_remove() {
    local name=$1
    find . -name "*$1*" |while read -r line; do echo rm -v -I "$line"; done
}

describe_file() {
    local fpath="$1"
    file "$fpath"
    ls -lah "$fpath"
    if [[ -d "$fpath" ]]; then
        tree -L 3 --filelimit=20 "$fpath"
    elif [[ "$fpath" == *.csv ]]; then
        duckdb -box :memory: "DESCRIBE TABLE '$fpath' ;"
    elif [[ "$fpath" == *.csv.gz ]]; then
        duckdb -box :memory: "DESCRIBE TABLE '$fpath' ;"
    elif [[ "$fpath" == *.parquet ]]; then
        duckdb -box :memory: "DESCRIBE TABLE '$fpath' ;"
    else
        [[ $(type exiftool 2>&1) ]] && exiftool "$fpath"
    fi
}

preview_file() {
    local fpath="$1"
    if [[ -d "$fpath" ]]; then
        tree -L 3 --filelimit=20 "$fpath"
    elif [[ "$fpath" == *.csv ]]; then
        if [[ -x $(command -v duckdb) ]]; then
            duckdb :memory: "SELECT * FROM '$fpath' ;"
        else
            less -N "$fpath"
            # head -n 10 "$fpath"
            # echo ...
            # tail -n 10 "$fpath"
        fi
    elif [[ "$fpath" == *.csv.gz ]]; then
        if [[ -x $(command -v duckdb) ]]; then
            duckdb :memory: "SELECT * FROM '$fpath' ;"
        else
            zless -n 10 "$fpath"
        fi
    elif [[ "$fpath" == *.parquet ]]; then
        duckdb :memory: "SELECT * FROM '$fpath' ;"
    elif [[ "$fpath" == *.zip ]]; then
        zip -sf "$fpath"
    else
        echo TODO...
    fi
}

# debug_launcher() {
#     # REF:
#     # - https://github.com/fabiospampinato/vscode-debug-launcher/blob/master/docs/terminal.md
#     # - https://marketplace.visualstudio.com/items?itemName=fabiospampinato.vscode-debug-launcher
#     # REQUIRES:
#     # 1. MACOS
#     # 2. VSCODE + DEBUG LAUNCHER (EXTENSION)
#
#     # Examples:
#     # $ debug-launcher file /path/to/foo.js # Trigger `Debug Launcher: File` on the provided path
#     # $ debug-launcher auto /path/to/project # Trigger `Debug Launcher: Auto` on the provided path
#     # $ debug-launcher launch '{"type":"node","name":"Foo","request":"launch","program":"/path/to/foo.js"}' # Launch the debugger using a custom launch configuration
#     subcommand="$1"
#     args="$2"
#     if [[ "$subcommand" == "file" ]]; then
#         path="$(/usr/local/bin/realpath $args)"
#         /usr/bin/open "vscode://fabiospampinato.vscode-debug-launcher/file?args=$path"
#     else
#         /usr/bin/open "vscode://fabiospampinato.vscode-debug-launcher/$subcommand?args=$args"
#     fi
# }
