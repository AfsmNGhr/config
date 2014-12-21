#!/bin/bash

scripts="$HOME/.bin/festival/"
charge=$(cat /sys/class/power_supply/BAT0/capacity)
procent=$(${scripts}pluralform.sh $charge процент процента процентов)
status=$(cat /sys/class/power_supply/BAT0/status)
text=$(echo "Заряд батареи $charge $procent")
critical="Критический заряд батареи."

if [ "$status" == 'Discharging' ] && [ $charge -gt 10 -a $charge -lt 50 ];
then
    ${scripts}stop_play.sh > /dev/null 2>&1
    ${scripts}say.sh "$text"
    ${scripts}stop_play.sh > /dev/null 2>&1
elif [ "$status" == 'Discharging' ] && [ $charge -lt 10 ];
then
    ${scripts}stop_play.sh > /dev/null 2>&1
    ${scripts}say.sh "$critical"
    ${scripts}stop_play.sh > /dev/null 2>&1
fi
exit
