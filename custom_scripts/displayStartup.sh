#!/usr/bin/env sh

displayID=$(xrandr | grep connected | awk -F ' ' '{print $1}')

xrandr --ouptu $displayID --mode 1920x1080 --pos 0x0 --rotate normal; feh --bg-scale ~/Pictures/Wallpapers/wallpaper.jpg
