#!/bin/sh

## Load my servises ...
~/.fehbg
compton -cGb &
xset -dpms; xset s off &
parcellite -n &
start-pulseaudio-x11
setxkbmap -layout "us,ru" -option "grp:caps_toggle"
sxhkd &

## change cursor
xsetroot -cursor_name left_ptr

## Set Xresources to be sourced ...
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

## load wm ...
exec bspwm
