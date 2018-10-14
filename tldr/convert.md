# Convert Files

## Video Operation
- Video information
    $ exiftool <file>
    $ exiftool -imagesize -encoder <file>
    $ ffprobe -i <file>
- Multi-threads (custom CPU usage)
    $ ffmpeg -i FILE –threads 2 OUTPUT
- Split video (without conversion)
    $ ffmpeg -i FILE -ss START -t DURATION -vcodec copy -acodec copy OUTPUT
- Split video
    $ ffmpeg -i FILE -ss START -t DURATION OUTPUT
- rmvb to mp4
    $ ffmpeg -i FILE -c:a copy OUTPUT


## Audio Conversion
- mp4 to mp3
- mp4 to m4a
- mp3 to m4a


## Image Conversion
- PNG to JPG
- JPG to PNG
- HEIC to JPG

## PDF Conversion
- PDF to JPG
- PDF to Word
- Word to PDF
