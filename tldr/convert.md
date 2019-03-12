# Convert Files

## Image Conversion
- PNG to JPG
- JPG to PNG
- HEIC to JPG


## Video Conversion
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
    $ ffmpeg -i FILE.rmvb -c:a copy OUTPUT.mp4
- mp4 to flv
    $ ffmpeg -i FILE.mp4 -c:v libx264 -crf 19 OUTPUT.flv
    $ ffmpeg -i FILE.mp4 -c:v libx264 -ar 22050 -crf 28 OUTPUT.flv
- Subtitle: vtt -> srt


## Audio Conversion
- mp4 to mp3
    $ ffmpeg -i INPUT.mp4 OUTPUT.mp3
    $ ffmpeg -i INPUT.mp4 -b:a 192K -vn OUTPUT.mp3
- m4a to mp3
    $ ffmpeg -i INPUT.m4a OUTPUT.mp3
- webm to mp3
    $ ffmpeg -i "${FILE}" -vn -ab 128k -ar 44100 -y "${FILE%.webm}.mp3";
- mp4 to m4a
- mp3 to m4a

## PDF Operations
- Extract Page 1-15 to a file
    $ pdftk input.pdf cat 1-15 output new.pdf
- Extract Page 1-3，5，6-10, and combine to ONE file
    $ pdftk input.pdf cat 1-3 5 6-10 output combined.pdf
- Combine/Concatenate all selected files to ONE file
    $ pdftk file1.pdf file2.pdf ... cat output new.pdf
- Split every page as a new file with a format of name
    $ pdftk input.pdf burst output new_%d.pdf
- Combine PDFs in a RegEx pattern
    `$ pdftk *.pdf cat output combined.pdf`
- Remove Page 13 and make all others as a new
    $ pdftk in.pdf cat 1-12 14-end output out1.pdf
- Make odd.pdf with all odd pages，and even.pdf all even pages，下面的命令可以将两个 pdf 合并成页码正常的书
    $ pdftk A=odd.pdf B=even.pdf shuffle A B output collated.pdf
- Rotate every page with 180°
    $ pdftk input.pdf cat 1-endsouth output output.pdf
- Rotate Page 3 with 90°, remain the rest unchanged
    $ pdftk input.pdf cat 1-2 3east 4-end output output.pdf
- Remove the password in a PDF
    $ pdftk secured.pdf input_pw foopass output unsecured.pdf
- PDF to JPG
- PDF to Word
- Word to PDF
- Combin JPGs to PDF
    `$ convert "*.{png,jpg,jpeg}" -monitor -quality 100 outfile.pdf`
