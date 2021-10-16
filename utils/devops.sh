#! /usr/bin/env bash


filter_folder_contain_less_files(){
    for F in ./* ;do
        COUNT=$(find "$F" -type f | wc -l)
        # echo $COUNT
        if [ $COUNT -lt 3 ]; then
            # echo "$F"
            echo mv "$F" "./Various.Artists"
        fi
    done
}
