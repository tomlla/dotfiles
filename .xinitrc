#!/usr/bin/env bash

setxkbmap -option ctrl:nocaps
# setxkbmap -option japan:hztg_escape

xset r rate 160 60

# Dsiable beep
xset b off

export DefaultImModule=fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
export LC_CTYPE=ja_JP.utf8
fcitx5 -d

polybar &
nm-applet &

load_if_exist() {
    [ -e $1 ] && source $1
}
load_if_exist ~/.local.xinitrc

# exec i3
exec openbox
