# Download tools

## wget
- Download to folder:
    $ wget <url> -P ./folder
- 

## youtube-dl
- Common use:
    $ youtube-dl -civw -f bestvideo --proxy "" <URL>
- List video formats:
    $ youtube-dl --list-formats
- Download specific format:
    $ youtube-dl -f bestvideo+bestaudio <URL>
    $ youtube-dl -f worstvideo <URL>
    $ youtube-dl -f mp4 <URL>
- Download multiple versions of formats:
    $ youtube-dl -f mp4/bestvideo,w4a/bestaudio <URL>


## you-get
- Common use:
    $ you-get -x localhost:1080 <URL>
- List video formats:
    $ you-get -i <URL>
