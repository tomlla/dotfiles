setxkbmap -option ctrl:nocaps
# setxkbmap -option japan:hztg_escape

xset r rate 160 60

export DefaultImModule=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export LC_CTYPE=ja_JP.utf8
fcitx -d

exec i3
