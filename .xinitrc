#!/bin/sh

## Load my servises ...
~/.fehbg
compton -cGb &
xset -dpms; xset s off &
parcellite -n &
setxkbmap -layout "us,ru" -option "grp:caps_toggle"
sxhkd &

## Set Xresources to be sourced ...
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

## load wm ...
exec bspwm
