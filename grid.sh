#!/bin/bash

imguser=$1
iii=`basename $1`
array=($2)
#----------------------------------
O1="-55+10"
O2="-33+10"
O3="-11+10"
O4="+11+10"
O5="+33+10"
O6="+55+10"

X1="-55+10"
X2="-33+10"
X3="-11+10"
X4="+11+10"
X5="+33+10"
X6="+55+10"
#----------------------------------
K1P="-51+7"
K2P="-29+7"
K3P="-7+7"
K4P="+15+7"
K5P="+37+7"
K6P="+59+7"

K6L="+6-59"
K5L="+6-37"
K4L="+6-15"
K3L="+6+7"
K2L="+6+29"
K1L="+6+51"

AMP="+0-36"
BMP="+0+1"
CMP="+0+38"
DMP="+0+74"

AML="-37-5"
BML="-1-5"
CML="+35-5"
DML="+71-5"
#----------------------------------
A0="line 19,26 131,26"

A1="circle 20,48 27,48"
A2="circle 42,48 49,48"
A3="circle 64,48 71,48"
A4="circle 86,48 93,48"
A5="circle 108,48 115,48"
A6="circle 130,48 137,48"

B1="circle 20,84 27,84"
B2="circle 42,84 49,84"
B3="circle 64,84 71,84"
B4="circle 86,84 93,84"
B5="circle 108,84 115,84"
B6="circle 130,84 137,84"

C1="circle 20,120 27,120"
C2="circle 42,120 49,120"
C3="circle 64,120 71,120"
C4="circle 86,120 93,120"
C5="circle 108,120 115,120"
C6="circle 130,120 137,120"

D1="circle 20,156 27,156"
D2="circle 42,156 49,156"
D3="circle 64,156 71,156"
D4="circle 86,156 93,156"
D5="circle 108,156 115,156"
D6="circle 130,156 137,156"

I2A="stroke-linecap round path 'M 107,48 L 131,48'"
I3A="stroke-linecap round path 'M 85,48 L 131,48'"
I4A="stroke-linecap round path 'M 63,48 L 131,48'"
I5A="stroke-linecap round path 'M 41,48 L 131,48'"
I6A="stroke-linecap round path 'M 20,48 L 131,48'"

I2B="stroke-linecap round path 'M 107,84 L 131,84'"
I3B="stroke-linecap round path 'M 85,84 L 131,84'"
I4B="stroke-linecap round path 'M 63,84 L 131,84'"
I5B="stroke-linecap round path 'M 41,84 L 131,84'"
I6B="stroke-linecap round path 'M 20,84 L 131,84'"

I2C="stroke-linecap round path 'M 107,120 L 131,120'"
I3C="stroke-linecap round path 'M 85,120 L 131,120'"
I4C="stroke-linecap round path 'M 63,120 L 131,120'"
I5C="stroke-linecap round path 'M 41,120 L 131,120'"
I6C="stroke-linecap round path 'M 20,120 L 131,120'"

I2D="stroke-linecap round path 'M 107,156 L 131,156'"
I3D="stroke-linecap round path 'M 85,156 L 131,156'"
I4D="stroke-linecap round path 'M 63,156 L 131,156'"
I5D="stroke-linecap round path 'M 41,156 L 131,156'"
I6D="stroke-linecap round path 'M 20,156 L 131,156'"

STR=`echo -strokewidth 2`
STRD=`echo -strokewidth 7`
STRB=`echo -strokewidth 15.5`
DR=`echo -draw`

/usr/bin/convert -size 152x209 xc:white -stroke black -strokewidth 2 -draw "line 20,40 130,40" -draw "line 20,76 130,76" -draw "line 20,112 130,112" -draw "line 20,148 130,148" -draw "line 20,184 130,184" -draw "line 20,40 20,183" -draw "line 42,40 42,183" -draw "line 64,40 64,183" -draw "line 86,40 86,183" -draw "line 108,40 108,183" -draw "line 130,40 130,183" tmp.png

nn=`echo ${@} | cut -d "[" -f2 | cut -d "]" -f1`
frn=`echo ${@} | cut -d "(" -f2 | cut -d ")" -f1 | awk '{print $1}'`
frp=`echo ${@} | cut -d "(" -f2 | cut -d ")" -f1 | awk '{print $2}'`

if ! grep -q "(" <<<${@}; then
  /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRD $DR "$A0" eee.png
  /usr/bin/composite -gravity center eee.png tmp.png tmp.png
  rm eee.png
fi

#----------------------------------
for var in "${array[@]}"
do
  if [[ "$var" = "A1" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$A1" $var.png
	 /usr/bin/composite -gravity center A1.png tmp.png tmp.png
	 rm A1.png
  fi
  if [[ "$var" = "A2" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$A2" $var.png
	 /usr/bin/composite -gravity center A2.png tmp.png tmp.png
	 rm A2.png
  fi
  if [[ "$var" = "A3" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$A3" $var.png
	 /usr/bin/composite -gravity center A3.png tmp.png tmp.png
	 rm A3.png
  fi
  if [[ "$var" = "A4" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$A4" $var.png
	 /usr/bin/composite -gravity center A4.png tmp.png tmp.png
	 rm A4.png
  fi
  if [[ "$var" = "A5" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$A5" $var.png
	 /usr/bin/composite -gravity center A5.png tmp.png tmp.png
	 rm A5.png
  fi
  if [[ "$var" = "A6" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$A6" $var.png
	 /usr/bin/composite -gravity center A6.png tmp.png tmp.png
	 rm A6.png
  fi
  if [[ "$var" = "B1" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$B1" $var.png
	 /usr/bin/composite -gravity center B1.png tmp.png tmp.png
	 rm B1.png
  fi
  if [[ "$var" = "B2" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$B2" $var.png
	 /usr/bin/composite -gravity center B2.png tmp.png tmp.png
	 rm B2.png
  fi
  if [[ "$var" = "B3" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$B3" $var.png
	 /usr/bin/composite -gravity center B3.png tmp.png tmp.png
	 rm B3.png
  fi
  if [[ "$var" = "B4" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$B4" $var.png
	 /usr/bin/composite -gravity center B4.png tmp.png tmp.png
	 rm B4.png
  fi
  if [[ "$var" = "B5" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$B5" $var.png
	 /usr/bin/composite -gravity center B5.png tmp.png tmp.png
	 rm B5.png
  fi
  if [[ "$var" = "B6" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$B6" $var.png
	 /usr/bin/composite -gravity center B6.png tmp.png tmp.png
	 rm B6.png
  fi
  if [[ "$var" = "C1" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$C1" $var.png
	 /usr/bin/composite -gravity center C1.png tmp.png tmp.png
	 rm C1.png
  fi
  if [[ "$var" = "C2" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$C2" $var.png
	 /usr/bin/composite -gravity center C2.png tmp.png tmp.png
	 rm C2.png
  fi
  if [[ "$var" = "C3" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$C3" $var.png
	 /usr/bin/composite -gravity center C3.png tmp.png tmp.png
	 rm C3.png
  fi
  if [[ "$var" = "C4" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$C4" $var.png
	 /usr/bin/composite -gravity center C4.png tmp.png tmp.png
	 rm C4.png
  fi
  if [[ "$var" = "C5" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$C5" $var.png
	 /usr/bin/composite -gravity center C5.png tmp.png tmp.png
	 rm C5.png
  fi
  if [[ "$var" = "C6" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$C6" $var.png
	 /usr/bin/composite -gravity center C6.png tmp.png tmp.png
	 rm C6.png
  fi
  if [[ "$var" = "D1" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$D1" $var.png
	 /usr/bin/composite -gravity center D1.png tmp.png tmp.png
	 rm D1.png
  fi
  if [[ "$var" = "D2" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$D2" $var.png
	 /usr/bin/composite -gravity center D2.png tmp.png tmp.png
	 rm D2.png
  fi
  if [[ "$var" = "D3" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$D3" $var.png
	 /usr/bin/composite -gravity center D3.png tmp.png tmp.png
	 rm D3.png
  fi
  if [[ "$var" = "D4" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$D4" $var.png
	 /usr/bin/composite -gravity center D4.png tmp.png tmp.png
	 rm D4.png
  fi
  if [[ "$var" = "D5" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$D5" $var.png
	 /usr/bin/composite -gravity center D5.png tmp.png tmp.png
	 rm D5.png
  fi
  if [[ "$var" = "D6" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$D6" $var.png
	 /usr/bin/composite -gravity center D6.png tmp.png tmp.png
	 rm D6.png
  fi
#----------------------------------
  if [[ "$var" = "X1" ]]
  then /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$X1" 'X' eee.png; mv eee.png tmp.png
  fi
  if [[ "$var" = "X2" ]]
  then /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$X2" 'X' eee.png; mv eee.png tmp.png
  fi
  if [[ "$var" = "X3" ]]
  then /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$X3" 'X' eee.png; mv eee.png tmp.png
  fi
  if [[ "$var" = "X4" ]]
  then /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$X4" 'X' eee.png; mv eee.png tmp.png
  fi
  if [[ "$var" = "X5" ]]
  then /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$X5" 'X' eee.png; mv eee.png tmp.png
  fi
  if [[ "$var" = "X6" ]]
  then /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$X6" 'X' eee.png; mv eee.png tmp.png
  fi
#----------------------------------
  if [[ "$var" = "I6A" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I6A" $var.png
	 /usr/bin/composite -gravity center I6A.png tmp.png tmp.png
	 rm I6A.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$A6" A6.png
	 /usr/bin/composite -gravity center A6.png tmp.png tmp.png
	 rm A6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$A1" A1.png
	 /usr/bin/composite -gravity center A1.png tmp.png tmp.png
	 rm A1.png
  fi
  if [[ "$var" = "I5A" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I5A" $var.png
	 /usr/bin/composite -gravity center I5A.png tmp.png tmp.png
	 rm I5A.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$A6" A6.png
	 /usr/bin/composite -gravity center A6.png tmp.png tmp.png
	 rm A6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$A2" A2.png
	 /usr/bin/composite -gravity center A2.png tmp.png tmp.png
	 rm A2.png
  fi
  if [[ "$var" = "I4A" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I4A" $var.png
	 /usr/bin/composite -gravity center I4A.png tmp.png tmp.png
	 rm I4A.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$A6" A6.png
	 /usr/bin/composite -gravity center A6.png tmp.png tmp.png
	 rm A6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$A3" A3.png
	 /usr/bin/composite -gravity center A3.png tmp.png tmp.png
	 rm A3.png
  fi
  if [[ "$var" = "I3A" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I3A" $var.png
	 /usr/bin/composite -gravity center I3A.png tmp.png tmp.png
	 rm I3A.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$A6" A6.png
	 /usr/bin/composite -gravity center A6.png tmp.png tmp.png
	 rm A6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$A4" A4.png
	 /usr/bin/composite -gravity center A4.png tmp.png tmp.png
	 rm A4.png
  fi
  if [[ "$var" = "I2A" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I2A" $var.png
	 /usr/bin/composite -gravity center I2A.png tmp.png tmp.png
	 rm I2A.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$A6" A6.png
	 /usr/bin/composite -gravity center A6.png tmp.png tmp.png
	 rm A6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$A5" A5.png
	 /usr/bin/composite -gravity center A5.png tmp.png tmp.png
	 rm A5.png
  fi
  if [[ "$var" = "I6B" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I6B" $var.png
	 /usr/bin/composite -gravity center I6B.png tmp.png tmp.png
	 rm I6B.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$B6" B6.png
	 /usr/bin/composite -gravity center B6.png tmp.png tmp.png
	 rm B6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$B1" B1.png
	 /usr/bin/composite -gravity center B1.png tmp.png tmp.png
	 rm B1.png
  fi
  if [[ "$var" = "I5B" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I5B" $var.png
	 /usr/bin/composite -gravity center I5B.png tmp.png tmp.png
	 rm I5B.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$B6" B6.png
	 /usr/bin/composite -gravity center B6.png tmp.png tmp.png
	 rm B6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$B2" B2.png
	 /usr/bin/composite -gravity center B2.png tmp.png tmp.png
	 rm B2.png
  fi
  if [[ "$var" = "I4B" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I4B" $var.png
	 /usr/bin/composite -gravity center I4B.png tmp.png tmp.png
	 rm I4B.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$B6" B6.png
	 /usr/bin/composite -gravity center B6.png tmp.png tmp.png
	 rm B6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$B3" B3.png
	 /usr/bin/composite -gravity center B3.png tmp.png tmp.png
	 rm B3.png
  fi
  if [[ "$var" = "I3B" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I3B" $var.png
	 /usr/bin/composite -gravity center I3B.png tmp.png tmp.png
	 rm I3B.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$B6" B6.png
	 /usr/bin/composite -gravity center B6.png tmp.png tmp.png
	 rm B6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$B4" B4.png
	 /usr/bin/composite -gravity center B4.png tmp.png tmp.png
	 rm B4.png
  fi
  if [[ "$var" = "I2B" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I2B" $var.png
	 /usr/bin/composite -gravity center I2B.png tmp.png tmp.png
	 rm I2B.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$B6" B6.png
	 /usr/bin/composite -gravity center B6.png tmp.png tmp.png
	 rm B6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$B5" B5.png
	 /usr/bin/composite -gravity center B5.png tmp.png tmp.png
	 rm B5.png
  fi
  if [[ "$var" = "I6C" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I6C" $var.png
	 /usr/bin/composite -gravity center I6C.png tmp.png tmp.png
	 rm I6C.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$C6" C6.png
	 /usr/bin/composite -gravity center C6.png tmp.png tmp.png
	 rm C6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$C1" C1.png
	 /usr/bin/composite -gravity center C1.png tmp.png tmp.png
	 rm C1.png
  fi
  if [[ "$var" = "I5C" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I5C" $var.png
	 /usr/bin/composite -gravity center I5C.png tmp.png tmp.png
	 rm I5C.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$C6" C6.png
	 /usr/bin/composite -gravity center C6.png tmp.png tmp.png
	 rm C6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$C2" C2.png
	 /usr/bin/composite -gravity center C2.png tmp.png tmp.png
	 rm C2.png
  fi
  if [[ "$var" = "I4C" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I4C" $var.png
	 /usr/bin/composite -gravity center I4C.png tmp.png tmp.png
	 rm I4C.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$C6" C6.png
	 /usr/bin/composite -gravity center C6.png tmp.png tmp.png
	 rm C6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$C3" C3.png
	 /usr/bin/composite -gravity center C3.png tmp.png tmp.png
	 rm C3.png
  fi
  if [[ "$var" = "I3C" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I3C" $var.png
	 /usr/bin/composite -gravity center I3C.png tmp.png tmp.png
	 rm I3C.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$C6" C6.png
	 /usr/bin/composite -gravity center C6.png tmp.png tmp.png
	 rm C6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$C4" C4.png
	 /usr/bin/composite -gravity center C4.png tmp.png tmp.png
	 rm C4.png
  fi
  if [[ "$var" = "I2C" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I2C" $var.png
	 /usr/bin/composite -gravity center I2C.png tmp.png tmp.png
	 rm I2C.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$C6" C6.png
	 /usr/bin/composite -gravity center C6.png tmp.png tmp.png
	 rm C6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$C5" C5.png
	 /usr/bin/composite -gravity center C5.png tmp.png tmp.png
	 rm C5.png
  fi
  if [[ "$var" = "I6D" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I6D" $var.png
	 /usr/bin/composite -gravity center I6D.png tmp.png tmp.png
	 rm I6D.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$D6" D6.png
	 /usr/bin/composite -gravity center D6.png tmp.png tmp.png
	 rm D6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$D1" D1.png
	 /usr/bin/composite -gravity center D1.png tmp.png tmp.png
	 rm D1.png
  fi
  if [[ "$var" = "I5D" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I5D" $var.png
	 /usr/bin/composite -gravity center I5D.png tmp.png tmp.png
	 rm I5D.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$D6" D6.png
	 /usr/bin/composite -gravity center D6.png tmp.png tmp.png
	 rm D6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$D2" D2.png
	 /usr/bin/composite -gravity center D2.png tmp.png tmp.png
	 rm D2.png
  fi
  if [[ "$var" = "I4D" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I4D" $var.png
	 /usr/bin/composite -gravity center I4D.png tmp.png tmp.png
	 rm I4D.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$D6" D6.png
	 /usr/bin/composite -gravity center D6.png tmp.png tmp.png
	 rm D6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$D3" D3.png
	 /usr/bin/composite -gravity center D3.png tmp.png tmp.png
	 rm D3.png
  fi
  if [[ "$var" = "I3D" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I3D" $var.png
	 /usr/bin/composite -gravity center I3D.png tmp.png tmp.png
	 rm I3D.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$D6" D6.png
	 /usr/bin/composite -gravity center D6.png tmp.png tmp.png
	 rm D6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$D4" D4.png
	 /usr/bin/composite -gravity center D4.png tmp.png tmp.png
	 rm D4.png
  fi
  if [[ "$var" = "I2D" ]]
  then /usr/bin/convert -size 152x189 xc:transparent -stroke black $STRB $DR "$I2D" $var.png
	 /usr/bin/composite -gravity center I2D.png tmp.png tmp.png
	 rm I2D.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$D6" D6.png
	 /usr/bin/composite -gravity center D6.png tmp.png tmp.png
	 rm D6.png
	 /usr/bin/convert -size 152x189 xc:transparent -stroke black $STR $DR "$D5" D5.png
	 /usr/bin/composite -gravity center D5.png tmp.png tmp.png
	 rm D5.png
  fi
#----------------------------------
  if [[ "$var" = "O1" ]]
  then /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$O1" 'O' eee.png; mv eee.png tmp.png
  fi
  if [[ "$var" = "O2" ]]
  then /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$O2" 'O' eee.png; mv eee.png tmp.png
  fi
  if [[ "$var" = "O3" ]]
  then /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$O3" 'O' eee.png; mv eee.png tmp.png
  fi
  if [[ "$var" = "O4" ]]
  then /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$O4" 'O' eee.png; mv eee.png tmp.png
  fi
  if [[ "$var" = "O5" ]]
  then /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$O5" 'O' eee.png; mv eee.png tmp.png
  fi
  if [[ "$var" = "O6" ]]
  then /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$O6" 'O' eee.png; mv eee.png tmp.png
  fi
done
#----------------------------------

/usr/bin/convert tmp.png -crop 152x192+0+4 eee.png
/usr/bin/convert eee.png -splice 10x20 tmp.png 

for var in "${array[@]}"
do
  if [[ "$var" = "BL" ]]
  then
	/usr/bin/convert -size 1x1 xc:white tmp.png
  fi
done

for var in "${array[@]}"
do
  if [[ "$var" = "LS" ]]
  then
	/usr/bin/convert -rotate 270 tmp.png eee.png; mv eee.png tmp.png
	format="LS"
  fi
done
 
#----------------------------------

if [[ "$frp" = "A" ]]
then
  if [[ "$format" = "LS" ]]
  then
	/usr/bin/convert tmp.png -gravity South -pointsize 20 -annotate "$AML" "$frn" eee.png; mv eee.png tmp.png
  else
	/usr/bin/convert tmp.png -gravity West -pointsize 20 -annotate "$AMP" "$frn" eee.png; mv eee.png tmp.png
  fi
fi

if [[ "$frp" = "B" ]]
then
  if [[ "$format" = "LS" ]]
  then
	/usr/bin/convert tmp.png -gravity South -pointsize 20 -annotate "$BML" "$frn" eee.png; mv eee.png tmp.png
  else
	/usr/bin/convert tmp.png -gravity West -pointsize 20 -annotate "$BMP" "$frn" eee.png; mv eee.png tmp.png
  fi
fi

if [[ "$frp" = "C" ]]
then
  if [[ "$format" = "LS" ]]
  then
	/usr/bin/convert tmp.png -gravity South -pointsize 20 -annotate "$CML" "$frn" eee.png; mv eee.png tmp.png
  else
	/usr/bin/convert tmp.png -gravity West -pointsize 20 -annotate "$CMP" "$frn" eee.png; mv eee.png tmp.png
  fi
fi
    
if [[ "$frp" = "D" ]]
then
  if [[ "$format" = "LS" ]]
  then
	/usr/bin/convert tmp.png -gravity South -pointsize 20 -annotate "$DML" "$frn" eee.png; mv eee.png tmp.png
  else
	/usr/bin/convert tmp.png -gravity West -pointsize 20 -annotate "$DMP" "$frn" eee.png; mv eee.png tmp.png
  fi
fi

for var in "${array[@]}"
do
  if [[ "$var" = "O1" ]]
  then 
	if [[ ! -n ${nn//[0-9]/} ]]
	 then
	   if [[ "$format" = "LS" ]]
	   then
		 /usr/bin/convert tmp.png -gravity West -pointsize 20 -annotate "$K1L" "[$nn]" eee.png; mv eee.png tmp.png
	   else
		 /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$K1P" "[$nn]" eee.png; mv eee.png tmp.png
	   fi
	 fi
  fi
  if [[ "$var" = "O2" ]]
  then
	if [[ ! -n ${nn//[0-9]/} ]]
	 then
	   if [[ "$format" = "LS" ]]
	   then
		 /usr/bin/convert tmp.png -gravity West -pointsize 20 -annotate "$K2L" "[$nn]" eee.png; mv eee.png tmp.png
	   else
		 /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$K2P" "[$nn]" eee.png; mv eee.png tmp.png
	   fi
	 fi
  fi
  if [[ "$var" = "O3" ]]
  then 
	if [[ ! -n ${nn//[0-9]/} ]]
	 then
	   if [[ "$format" = "LS" ]]
	   then
		 /usr/bin/convert tmp.png -gravity West -pointsize 20 -annotate "$K3L" "[$nn]" eee.png; mv eee.png tmp.png
	   else
		 /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$K3P" "[$nn]" eee.png; mv eee.png tmp.png
	   fi
	 fi
  fi
  if [[ "$var" = "O4" ]]
  then 
	if [[ ! -n ${nn//[0-9]/} ]]
	 then
	   if [[ "$format" = "LS" ]]
	   then
		 /usr/bin/convert tmp.png -gravity West -pointsize 20 -annotate "$K4L" "[$nn]" eee.png; mv eee.png tmp.png
	   else
		 /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$K4P" "[$nn]" eee.png; mv eee.png tmp.png
	   fi
	 fi
  fi
  if [[ "$var" = "O5" ]]
  then 
	if [[ ! -n ${nn//[0-9]/} ]]
	 then
	   if [[ "$format" = "LS" ]]
	   then
		 /usr/bin/convert tmp.png -gravity West -pointsize 20 -annotate "$K5L" "[$nn]" eee.png; mv eee.png tmp.png
	   else
		 /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$K5P" "[$nn]" eee.png; mv eee.png tmp.png
	   fi
	 fi
  fi
  if [[ "$var" = "O6" ]]
  then 
	if [[ ! -n ${nn//[0-9]/} ]]
	 then
	   if [[ "$format" = "LS" ]]
	   then
		 /usr/bin/convert tmp.png -gravity West -pointsize 20 -annotate "$K6L" "[$nn]" eee.png; mv eee.png tmp.png
	   else
		 /usr/bin/convert tmp.png -gravity North -pointsize 20 -annotate "$K6P" "[$nn]" eee.png; mv eee.png tmp.png
	   fi
	 fi
  fi
done
#----------------------------------
k=`echo $[ 1 + $[ RANDOM % 10000 ]]`
mv tmp.png $iii/$k.png
rm tmp.png
echo $k > diagram