#!/bin/bash

scripts="$HOME/.bin/festival/"
charge=$(acpi -b | grep -o [0-9]* | sed "2 ! d")
procent=$(${scripts}pluralform.sh $charge процент процента процентов)
status=$(acpi -b | cut -d " " -f 3 | cut -d "," -f 1)
text=$(echo "Заряд батареи $charge $procent")
critical="Критический заряд батареи. Требуется подъзарядка"

if [ "$status" == 'Discharging' ] && [ $charge -gt 5 -a $charge -lt 50 ];
then
    ${scripts}stop_play.sh > /dev/null 2>&1
    ${scripts}say.sh "$text"
    ${scripts}stop_play.sh > /dev/null 2>&1
elif [ "$status" == 'Discharging' ] && [ $charge -lt 5 ];
then
    ${scripts}stop_play.sh > /dev/null 2>&1
    ${scripts}say.sh "$critical"
    ${scripts}stop_play.sh > /dev/null 2>&1
fi
exit
