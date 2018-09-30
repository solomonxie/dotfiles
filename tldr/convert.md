# Convert Files

## Video Operation
- Video information
    $ exiftool <file>
    $ exiftool -imagesize -encoder <file>
    $ ffprobe -i <file>
- Split video
    $ ffmpeg -i <file> -ss <start> -t <duration> <output-file> 
- Split video (without conversion)
    $ ffmpeg -i <file> -ss <start> -t <duration> -vcodec copy -acodec copy <output-file>
- avi to mp4
    $ 
- mov to mp4
    $ 


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
