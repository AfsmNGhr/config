#!/bin/sh

## Load my servises ...
~/.fehbg
compton -cGb --config ~/.config/compton.conf &
xset -dpms; xset s off &
xflux -l 47.13 -g 39.43 &
parcellite -n &
setxkbmap -layout "us,ru" -option "grp:caps_toggle"
sxhkd &
dunst &

## change cursor
xsetroot -cursor_name left_ptr

## Set Xresources to be sourced ...
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

## load wm ...
exec bspwm
