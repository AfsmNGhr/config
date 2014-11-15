#!/bin/bash

scripts=/home/afsmnghr/.bin/festival/
charge=$(acpi -b | grep -o [0-9]* | sed "2 ! d")
procent=$(${scripts}pluralform.sh $charge процент процента процентов)
status=$(acpi -b | cut -d " " -f 3 | cut -d "," -f 1)
volume=$(amixer | grep -o [0-9]* | sed "5 ! d")
text=$(echo "Заряд батареи $charge $procent")

if test "$status" == 'Discharging';
then
    amixer -D pulse set Master 30% > /dev/null 2>&1;
    ${scripts}stop_play.sh > /dev/null 2>&1
    ${scripts}say.sh "$text"
    amixer -D pulse set Master $volume% > /dev/null 2>&1;
    ${scripts}stop_play.sh > /dev/null 2>&1
fi
exit 0
