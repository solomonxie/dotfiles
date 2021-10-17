# Command Line Tools Reference


## lookatme

> Presentation tool for Markdown.

REF: https://github.com/d0c-s4vage/lookatme#known-extensions

Extention:
- https://github.com/d0c-s4vage/lookatme.contrib.render


```sh
pip install lookatme lookatme.contrib.render

lookatme /path/to/readme.md


# Live mode: will auto re-render after content change
lookatme /path/to/readme.md --live
```


## visidata

> Great CSV **interactive** app in command line as alternative to Excel/Spreadsheet/Numbers.

REF: https://www.visidata.org/docs/

```sh
# Install
pip install visidata

# Open
visidata /path/to/data.csv

# Open compressed file
visidata /path/to/data.csv.gz

# Short command
vd /path/to/data.csv
```


### Navigation:
- `hjkl`: move focus around
- `HJKL`: move current row/column
- `Ctrl-h`: show help menu

### Sort:
REF: https://www.visidata.org/docs/edit/

- `#`: specify current column as numeric
- `[` or `]`: sort current column in ascend/descend order

### Filter:
- `|`: grep in current column and select matched rows
- `s`: select specific rows one by one
- `"`: show select rows only

### Edit:
REF: https://www.visidata.org/docs/edit/
- `'`: duplicate current column
- `e`: edit current cell
- `Ctrl-s`: save file
- `ga`: add rows (tell number of rows to be added, then edit each cell)
- `e` then `Ctrl-o`: launch default shell editor to edit the value

### Diagram:
- `Shift-F`: show histogram of current column
