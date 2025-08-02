#!/usr/bin/env bash

setxkbmap -option ctrl:nocaps
# setxkbmap -option japan:hztg_escape

xset r rate 160 60
# Dsiable beep
xset b off

export LC_CTYPE=ja_JP.utf8

run_fcitx() {
    export DefaultImModule=fcitx5
    export GTK_IM_MODULE=fcitx5
    export QT_IM_MODULE=fcitx5
    export XMODIFIERS=@im=fcitx5
    fcitx5 -d
}


# Packages for iBus
# ibus-mozc-with-jp-dict
# ibus-mozc-ut-full
run_ibus() {
    export GTK_IM_MODULE=ibus
    export QT_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus

    ibus-daemon -rxRd
}

# run_ibus
run_fcitx

nm-applet &

load_if_exist() {
    [ -e $1 ] && source $1
}

# これで設定するよよいやつ
# - TERMINAL # i3-sensible-terminalで使う
# - BROWSER # i3-sensible-browser で使う
# - WALLPAPER_FILE
# polybar or etc
load_if_exist ~/.local.xinitrc

[ -e $WALLPAPER_FILE ] && feh --bg-scale $WALLPAPER_FILE

# exec i3
exec openbox
