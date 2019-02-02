#!/bin/bash

limitd=$1
limitf=$2

Cntcc=0
for line in `ls -dt *-cc`
do
    if [[ $Cntcc -ge $limitd ]]
    then
	rm -rf $line	
    fi
    Cntcc=`expr $Cntcc + 1`
done

Cnteps=0
for line in `ls -dt *.eps`
do
    if [[ $Cnteps -ge $limitf ]]
    then
	rootname=$(basename $line .eps)
	rm $rootname.html
	rm $line
    fi
    Cnteps=`expr $Cnteps + 1`
done