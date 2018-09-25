# Download tools

## wget
- Download to folder:
    $ wget <URL> -P ./folder
- Specify a file name:
    $ wget <URL> -o ./filename.txt
- Download whole website as static site:
    # wget -r --convert-links <URL>

## youtube-dl
- Common use:
    $ youtube-dl -civw --proxy "localhost:1080" -f best/mp4  --write-sub <URL> 
- List video formats:
    $ youtube-dl -F <URL>
- Force overwrite:
    $ youtube-dl --no-continue <URL>
- Write subtitles
    $ youtube-dl --write-sub --convert-subs srt <URL>
- Specify format:
    $ youtube-dl -f best <URL>
    $ youtube-dl -f worstvideo <URL>
    $ youtube-dl -f mp4 <URL>
- Download Audio:
    $ youtube-dl -f bestaudio/m4a <URL>
- Download multiple versions of formats:
    $ youtube-dl -f mp4/bestvideo,w4a/bestaudio <URL>
- With cookies:
    $ youtube-dl --cookies cookies.txt <URL>


## you-get
- Common use:
    $ you-get -x localhost:1080 <URL>
- List video formats:
    $ you-get -i <URL>
- With cookies:
    $ you-get --cookies cookies.txt <URL>
