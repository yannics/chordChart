#!/bin/bash
name=`basename "$1" | cut -d. -f1`
cat $1 | sed -e '/<!-- stitle -->/,/<!-- etitle -->/d' | sed -e '/<!-- sfooter -->/,/<!-- efooter -->/d' > foo$name.html
./wkhtmltoimage-amd64 --width 2048 --zoom 2 foo$name.html foo$name.png 
/usr/bin/convert foo$name.png -fuzz 1% -trim +repage -bordercolor white -compose Copy -border 10 $name.eps
rm foo$name.html foo$name.png