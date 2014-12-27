#!/bin/bash

scripts="$HOME/.bin/festival/"
charge=$(cat /sys/class/power_supply/BAT0/capacity)
procent=$(${scripts}pluralform.sh $charge процент процента процентов)
status=$(cat /sys/class/power_supply/BAT0/status)
text=$(echo "Заряд батареи $charge $procent")
critical="Критический заряд батареи."

if [ "$status" == 'Discharging' ] && [ $charge -gt 10 -a $charge -lt 50 ];
then
    ${scripts}say.sh "$text"
elif [ "$status" == 'Discharging' ] && [ $charge -lt 10 ];
then
    ${scripts}say.sh "$critical"
fi
exit
