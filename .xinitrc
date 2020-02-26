#!/bin/sh

## Gui
~/.fehbg
# compton -cGb --config ~/.config/compton.conf &
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
xset -dpms; xset s off &

## Utils
xflux -l 47.13 -g 39.43 &
parcellite -n &

## Kbd
setxkbmap -layout "us,ru" -option "grp:caps_toggle" &
sxhkd &

## Notification
systemctl --user import-environment DISPLAY
dunst &

## Change cursor
xsetroot -cursor_name left_ptr

## Set Xresources to be sourced ...
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

## Load wm ...
exec bspwm
