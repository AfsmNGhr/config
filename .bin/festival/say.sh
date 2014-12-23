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
amixer set Master 67% > /dev/null 2>&1
aplay $data/saytext_$i.wav > /dev/null 2>&1

aplay=$(ps -el | grep aplay | wc -l)
if [ $aplay -eq 0 ];
then amixer set Master $volume% > /dev/null 2>&1;
fi

rm -f $data/saytext_$i.wav
