# How to Setup
# ============
# ln -sf ~/.dotfiles/bigot/.local.xinitrc ~/.local.xinitrc

# i3-sensible-terminal follows $TERMINAL variable
export TERMINAL=ghostty
# export TERMINAL=alacritty

# i3-sensible-browser follows $BROWSER variable
export BROWSER=google-chrome

export WALLPAPER_FILE=~/n/wallpapers/archlinux-purple-wallpaper-4k.png


speed=1.0 # -1.0 ~ 1.0 
xinput set-prop "Logitech ERGO M575" "libinput Accel Speed" $speed

picom &
tint2 &
