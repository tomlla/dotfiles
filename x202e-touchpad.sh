#!/bin/sh
xinput --set-prop "ETPS/2 Elantech Touchpad" "Synaptics Tap Action"  2, 3, 0, 0, 1, 3, 0
xinput --set-prop "ETPS/2 Elantech Touchpad" "Synaptics Click Action" 1, 3, 2

#タッチパッドを無効化
#shft,ctrl,altでは無効化させない(-K)
#停止時間を1sに(-i 1)
syndaemon -d -t -i 1 -K
