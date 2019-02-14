# Download tools

## wget
- Download to folder: -P ./folder
- Specify a file name: -o ./filename.txt
- Download whole website as static site: -r --convert-links

## youtube-dl
- Common use:
    $ youtube-dl -civw --write-sub -f best/mp4 <URL> 
    $ youtube-dl -civw --write-sub -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 <URL> 
- Proxy: --proxy "localhost:1080"
- List video formats: -F or --list-format
- Force overwrite: --no-continue
- Write subtitles: --write-sub --convert-subs srt
- Specify format:
    * -f best, or -f best/mp4
    * -f worst
- Merge Video-only and its Audio:
    * -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4
- Download Audio: -f bestaudio/m4a
- Download multiple versions of formats: -f mp4/bestvideo,w4a/bestaudio
- With cookies: --cookies cookies.txt
- Name format:
    * Single: -o "%(title)s.%(ext)s"
    * Playlist: -o "%(playlist_index)s-%(title)s.%(ext)s"
                -o "%(playlist_title)s-%(playlist_index)s-%(title)s.%(ext)s"


## you-get
- Common use: $ you-get -x localhost:1080 <URL>
- Proxy: -x localhost:1080
- List video formats: -i
- With cookies: --cookies cookies.txt <URL>

