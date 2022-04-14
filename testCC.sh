#!/bin/bash

function testHead
{
testtxt=`cat $1 | grep -n "^$2\[.*\]$"`
if [ "${testtxt:0:1}" != "$3" ]; then echo 0; exit 1; fi 
}

thefile=$1

testHead $thefile title 1
testHead $thefile subtitle 2
testHead $thefile composer 3
testHead $thefile comment 4
testHead $thefile boxwidth 5
testHead $thefile boxheight 6
testHead $thefile diagram 7
testHead $thefile chordsize 8

echo 1