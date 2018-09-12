# Download tools

## wget
- Download to folder:
    $ wget <url> -P ./folder
- 

## youtube-dl
- Common use:
    $ youtube-dl -civw --write-sub --proxy "localhost:1087" -f best,mp4 <URL> 
- List video formats:
    $ youtube-dl --list-formats <URL>
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
    $ you-get -x localhost:1087 <URL>
- List video formats:
    $ you-get -i <URL>
- With cookies:
    $ you-get --cookies cookies.txt <URL>
