#!/bin/bash

data="$HOME/.bin/festival/data"
ru="(voice_msu_ru_nsh_clunits)"
volume=$(amixer | grep -o [0-9]* | sed "5 ! d")
i=$(ls -r $data | grep -o [0-9]* | sed "1 ! d")
date=$(date | grep -o [0-9]* | sed "2 ! d")
xbacklight=$(xbacklight)
lid=$(grep -q closed /proc/acpi/button/lid/*/state)

if [ $xbacklight != 0.000000 ] || [ $? = 0 ]
then

    if test -z "$i"
    then i=1
    elif test -f "$data/saytext_$i.wav"
    then i=$(($i+1))
    fi

    echo "$1" | text2wave -o $data/saytext_$i.wav -eval $ru > /dev/null 2>&1
    amixer set Master 70% > /dev/null 2>&1
    aplay $data/saytext_$i.wav > /dev/null 2>&1

    aplay=$(ps -el | grep aplay | wc -l)
    if [ $aplay -eq 0 ]
    then amixer set Master $volume% > /dev/null 2>&1
    fi

    rm -f $data/saytext_$i.wav

fi
