#common config
xrdb $HOME/.Xresources
$HOME/.dropbox-dist/dropboxd &
xrandr --output LVDS0 --off

feh --bg-scale .wp &
#hsetroot -solid "#000066"
#xcompmgr -cfF &

xmodmap $HOME/.Xmodmap 
xmodmap $HOME/.Xkeymap 


tint2 -c .config/tint2/v-black &
openbox

#awesome 

#xmonad
