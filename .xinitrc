#!/bin/sh
#export GTK2_RC_FILES="$HOME/.gtkrc-2.0" #this line no need?

~/touchpad.sh

DEFAULT_SESSION=openbox-session
case $1 in
openbox) exec openbox-session ;;
dwm)
    #feh --bg-tile .config/wallpapers/assassinsCreed.jpeg
    exec ck-launch-session dwm ;;
*) exec $DEFAULT_SESSION  ;;
esac
