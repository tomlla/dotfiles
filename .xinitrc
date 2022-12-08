
setxkbmap -option ctrl:nocaps
# setxkbmap -option japan:hztg_escape

xset r rate 160 60

export DefaultImModule=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export LC_CTYPE=ja_JP.utf8
fcitx5 -d
#  exec mate-session
#  
#  # for f in $(find ~/local.x.d -type f -o -type l); do
#  #     source $f
#  # done
#  
xinput set-prop 12 279 1
xinput set-prop 12 285 1


amixer set Speaker mute
exec i3
