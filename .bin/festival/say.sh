#!/bin/bash

data="$HOME/.bin/festival/data"
ru="(voice_msu_ru_nsh_clunits)"
volume=$(amixer | grep -o [0-9]* | sed "5 ! d")
i=$(ls -r $data | grep -o [0-9]* | sed "1 ! d")

if test -z "$i";
then i=1;
elif test -f "$data/saytext_$i.wav";
then i=$(($i+1));
fi

echo "$1" | text2wave -o $data/saytext_$i.wav -eval $ru > /dev/null 2>&1
amixer set Master 40% > /dev/null 2>&1
aplay $data/saytext_$i.wav > /dev/null 2>&1
amixer -D pulse set Master $volume% > /dev/null 2>&1
rm -f $data/saytext_$i.wav
