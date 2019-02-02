#!/bin/bash

# width box
wb=$2
# height box
hb=$3
# fontsize
ee=$4
asi=`echo $(($ee*2))`
as=`echo $(($asi/3))`

imguser=$5
# width diagram
wd=$6

mes=$(head -n 1 $1)
first="$(echo $mes | head -c 1)"
if [[ "$first" != "|" ]]; then
    mes=`echo $mes | sed 's/_/\&nbsp;/g'`
    echo "<CAPTION class=\"left\">"

    if [[ "$first" = "\\" ]]; then
	timesignature=`echo $mes | awk '{print $1}' | awk '{print substr($0,2)}'`
	echo "<img class=\"cap\" src=\"img/$timesignature.png\" alt=\"$timesignature\" height=\"35\">"
	mes=`echo $mes | sed 's/\\\[0-9]*//g'`
    fi
    
    tempo=`echo $mes | awk -F 'tempo=|,' '{print $2}'`
    tempoimg=`echo "<img class=\"cap\" src=\"http:\/\/mus-ics.net\/chordChart\/img\/$tempo.png\" alt=\"$tempo\" height=\"$ee\">"`
    echo $mes | sed 's/annot=/<span class=\"annotfont\" style=\"font-size:zzz;\">/g' | sed "s/zzz/$as/g" | sed 's/@/<\/span>/g' | sed "s/tempo.*\,/$tempoimg/g"
    echo "</CAPTION><tr>"
fi
   
cat $1 | while read s
	 do
	     declare -a array
	     #s=$1
	     IFS="|"
	     set -- $s
	     array=($@)
	     for((i=1;i<=${#array[@]};i+=2))
	     do
		 aaa=`echo ${array[$i]} | sed 's/_/\&nbsp;/g'`
		 img=`echo "$aaa" | awk '{print $1}'`
		 chord=`echo "$aaa" | cut -d ' ' -f2-`
		 rep=`echo "$chord" | awk -F 'rep=|@' '{print $2}'`
		 if [[ -n "$rep" ]]; then
		     k=`echo $[ 1 + $[ RANDOM % 10000 ]]`
		     /usr/bin/convert img/rep.png -font Arial -pointsize 190 -draw "gravity NorthWest fill black text 100,100 '$rep'" $imguser/$k.png
		     repimg="url(chordChart/$imguser/$k.png),"
		     chord=`echo $chord | sed 's/rep=.*@//g'`
		 else
		     repimg=""
		 fi
		 fortest=`echo $img | head -c 1 | tail -c 1`

		 if [[ -n "$aaa" ]]; then
		     if [[ $fortest == "!" ]]
		     then

#/usr/bin/convert online
#/opt/local/bin/convert offline
#---------------------------------
			 echo $aaa | perl -pe 'BEGIN{$/=\1}if($l>0&&/\s/){$_="-"}elsif($_ eq"{"){$l++}elsif($_ eq"}"){$l--}' | tr ' ' '\n' > tmp$1
			 while read name
			 do
			     imgwt1=`echo $name | awk -F 'cres|px' '{print $2}' | sed 's/=//g'`
			     imgwt1=`echo $(($imgwt1*4))`
			     d1=$imgwt1
			     d1+="x60"
			     if [[ -n "$imgwt1" ]]; then
			     /usr/bin/convert -size $d1 xc:white -stroke gray45 -strokewidth 4 -draw "line 0,30 $imgwt1,15" -draw "line 0,30 $imgwt1,45" $imguser/$imgwt1-cres.png
			     fi
			     
			     imgwt2=`echo $name | awk -F 'dim|px' '{print $2}' | sed 's/=//g'`
			     imgwt2=`echo $(($imgwt2*4))`
			     d2=$imgwt2
			     d2+="x60"
			     if [[ -n "$imgwt2" ]]; then
			     /usr/bin/convert -size $d2 xc:white -stroke gray45 -strokewidth 4 -draw "line 0,15 $imgwt2,30" -draw "line 0,45 $imgwt2,30" $imguser/$imgwt2-dim.png
			     fi
			     
			     chordname=`echo $name | awk -F ':' '{print $2}' | sed 's/\&nbsp;/\ /g'`
			     name=`echo $name | cut -f1 -d":"`
			     diagram=`echo $name | awk -F '{' '{print $2}' | sed 's/}/-/g'`
			     dia=`echo $diagram | sed 's/-/ /g'`
			     if [[ -n "$diagram" ]]; then
				 ./grid.sh $imguser $dia
				 diagramme=`cat diagram`
				 rm diagram
				 diasize=$wd
			     fi
			     if [[ "$name" != "" ]]; then
				 cn=`echo "<figcaption>$chordname<\/figcaption>"`
			     fi
			     
			     echo $name |
			     sed 's/cres=.*px/<img src=\\\"zzz2\\\" alt=\\\"crescendo\\\" align=\\\"center\\\" height=\\\"14\\\">/g' |
			     sed "s/zzz2/$imguser\/$imgwt1-cres.png/g" |
			     sed 's/dim=.*px/<img src=\\\"zzz1\\\" alt=\\\"decrescendo\\\" align=\\\"center\\\" height=\\\"14\\\">/g' |
			     sed "s/zzz1/$imguser\/$imgwt2-dim.png/g" |
			     sed 's/{.*}/<figure><img src=\\\"zzz33\\\" alt=\\\"diagram\\\" align=\\\"center\\\" width=\\\"sizzz\\\" style=\\\"float:left;\\\">chordnamezzz<\/figure>/g' |
			     sed "s/zzz33/$imguser\/$diagramme.png/g" |
			     sed "s/sizzz/$diasize/g" |
			     sed "s/chordnamezzz/$cn/g"
			     		    
			 done < tmp$1 | xargs >> ttmp$1
			 rm tmp$1
			 aaa=`cat ttmp$1`
			 rm ttmp$1
#---------------------------------
			
			 tmp=`echo $aaa | sed 's/!//g' | sed 's/+/<\/TD><TD class=\"annotfont\" style=\"font-size:zzz;\" colspan=/g' | sed "s/zzz/$as/g"`
			 #tmp=${tmp/zzz/$as}
			 echo "<TD class=\"annotfont\" style=\"font-size:$as;\" colspan=$tmp</TD>"
		     fi
		     if [[ $fortest == "?" ]]
		     then
			 tmp=`echo $aaa | sed 's/?//g' | sed 's/!//g' | sed 's/+/<\/TD><TD style=\"font-family:monospace;font-size:16;\" colspan=/g' | sed "s/zzz/$as/g"`
			 #tmp=${tmp/zzz/$as}
			 echo "<TD style=\"font-family:monospace;font-size:16;\" colspan=$tmp</TD>"
		     fi
		     if [[ $fortest == "/" ]]
		     then
			 echo "<td class=\"chordfont\" width=$wb height=$hb style=\"background-image:url(img/sep.png); background-size: 22px 27px;background-repeat:no-repeat;\"></td>"
		     fi
		     if [[ $img == a ]] || [[ $img == la ]] || [[ $img == ra ]] || [[ $img == fa ]]; then
			 echo "<td class=\"chordfont\" width=$wb height=$hb align=\"center\" style=\"background-image:$repimg url(img/$img.png); background-size: "$wb"px "$hb"px;background-repeat:no-repeat;\">$chord</td>"
		     fi
		     if [[ $img == cl ]] || [[ $img == cr ]] || [[ $img == ct ]] || [[ $img == cb ]]; then
			 echo "<td class=\"chordfont\" width=$wb height=$hb align=\"center\" style=\"background-image:$repimg url(img/$img.png); background-size: "$wb"px "$hb"px;background-repeat:no-repeat;\">$chord</td>"
		     fi
		     if [[ $img == x ]]; then
			 echo "<td class=\"chordfont\" width=$wb height=$hb align=\"center\">$chord</td>"
		     fi
		     if [[ $img == b ]] || [[ $img == lb ]] || [[ $img == rb ]] || [[ $img == fb ]]; then
			 w1=`echo $chord | awk '{print $1}'`
			 w2=`echo $chord | awk '{print $2}'`
			 echo "<td class=\"chordfont\" width=$wb height=$hb align=\"center\" style=\"background-image:$repimg url(img/$img.png); background-size: "$wb"px "$hb"px;background-repeat:no-repeat;\"><div align=\"left\" valign=\"top\">&nbsp;$w1</div><div align=\"right\" valign=\"bottom\">$w2&nbsp;</div></td>"
		     fi
		     if [[ $img == c ]] || [[ $img == lc ]] || [[ $img == rc ]] || [[ $img == fc ]]; then
			 w1=`echo $chord | awk '{print $1}'`
			 w2=`echo $chord | awk '{print $2}'`
			 w3=`echo $chord | awk '{print $3}'`
			 echo "<td class=\"chordfont\" width=$wb height=$hb align=\"center\" style=\"background-image:$repimg url(img/$img.png); background-size: "$wb"px "$hb"px;background-repeat:no-repeat;\">
<div align=\"center\" valign=\"top\">$w2</div>
<div align=\"left\" valign=\"middle\">&nbsp;$w1</div>
<div align=\"right\" valign=\"bottom\">$w3&nbsp;</div></td>"
		     fi
		     if [[ $img == d ]] || [[ $img == ld ]] || [[ $img == rd ]] || [[ $img == fd ]]; then
			 w1=`echo $chord | awk '{print $1}'`
			 w2=`echo $chord | awk '{print $2}'`
			 w3=`echo $chord | awk '{print $3}'`
			 echo "<td class=\"chordfont\" width=$wb height=$hb align=\"center\" style=\"background-image:$repimg url(img/$img.png); background-size: "$wb"px "$hb"px;background-repeat:no-repeat;\">
<div align=\"left\" valign=\"top\">&nbsp;$w1</div>
<div align=\"right\" valign=\"middle\">$w3&nbsp;</div>
<div align=\"center\" valign=\"bottom\">$w2</div></td>"
		     fi
		     if [[ $img == e ]] || [[ $img == le ]] || [[ $img == re ]] || [[ $img == fe ]]; then
			 w1=`echo $chord | awk '{print $1}'`
			 w2=`echo $chord | awk '{print $2}'`
			 w3=`echo $chord | awk '{print $3}'`
			 w4=`echo $chord | awk '{print $4}'`
			 echo "<td class=\"chordfont\" width=$wb height=$hb align=\"center\" style=\"background-image:$repimg url(img/$img.png); background-size: "$wb"px "$hb"px;background-repeat:no-repeat;\">
<div align=\"center\" valign=\"top\">$w2</div>
<div align=\"left\" valign=\"middle\"><span>&nbsp;$w1</span><span style=\"float:right;\">$w4&nbsp;</span></div>
<div align=\"center\" valign=\"bottom\">$w3</div></td>"
		     fi
		     if [[ $img == f ]] || [[ $img == lf ]] || [[ $img == rf ]] || [[ $img == ff ]] || [[ $img == g ]] || [[ $img == lg ]] || [[ $img == rg ]] || [[ $img == fg ]]; then
			 w1=`echo $chord | awk '{print $1}'`
			 w2=`echo $chord | awk '{print $2}'`
			 echo "<td class=\"chordfont\" width=$wb height=$hb align=\"center\" style=\"background-image:$repimg url(img/$img.png); background-size: "$wb"px "$hb"px;background-repeat:no-repeat;\">
<div align=\"left\" valign=\"middle\"><span>&nbsp;$w1</span><span style=\"float:right;\">$w2&nbsp;</span></div></td>"
		     fi
		 else
		     echo "</tr><tr>"
		 fi
	     done
	 done
echo "</tr>"