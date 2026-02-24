#!/bin/sh

EXT_MONITOR=$(xrandr |grep '^DisplayPort' |grep connected -w | awk '{print $1}' |head -1)
if [ -z "$EXT_MONITOR" ]; then
    echo "No external monitor"
    exit 1
fi

echo EXT_MONITOR=$EXT_MONITOR

xrandr \
--output eDP --primary --mode 1920x1200 --pos 3840x0 \
--output $EXT_MONITOR --mode 3840x2160 --pos 0x196

[ -e $WALLPAPER_FILE ] && feh --bg-scale $WALLPAPER_FILE

