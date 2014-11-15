#!/bin/bash
set -x

user="afsmnghr"
data=/home/$user/.bin/festival/data
ru="(voice_msu_ru_nsh_clunits)"
n=1

while test -f $data/saytext_ru_$n.wav;
do
    n=$(($n+1))
    return
done

echo "$1" | text2wave -o $data/saytext_$n.wav -eval $ru > /dev/null 2>&1
aplay $data/saytext_$n.wav > /dev/null 2>&1
# rm -f $data/saytext_$n.wav
