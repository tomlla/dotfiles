#!/bin/sh
xinput --set-prop "ETPS/2 Elantech Touchpad" "Synaptics Tap Action"  2, 3, 0, 0, 1, 3, 0
xinput --set-prop "ETPS/2 Elantech Touchpad" "Synaptics Click Action" 1, 3, 2

syndaemon -d -i 1 -K
