#!/usr/bin/env bash

# pactl list cards |

# Name: alsa_card.pci-0000_04_00.6

CURRENT_PROFILE=$(
    pactl list cards | grep -A30 "$CARD_NAME" | grep "Active Profile:" | cut -d: -f2 - | xargs
)

echo "Current profile: \"$CURRENT_PROFILE\""

# Cards
# 1 = Name: alsa_card.pci-0000_04_00.6
# 3 = Name: alsa_card.pci-0000_04_00.6


set -x
CARD_ID=3
pactl set-card-profile $CARD_ID "HiFi (Mic1, Mic2, Speaker)"         # 一度別のものを指定
pactl set-card-profile $CARD_ID "HiFi (Headphones, Mic1, Mic2)"  
# 再度もとにもどすことで音が聞こえる
# このとき journalctl には以下のログが流れる
#
# rtkit-daemon: Supervising 8 threads of 2 processes of 1 users.
# rtkit-daemon: Successfully made thread 2961763 of process 2978 owned by '1000' RT at priority 5.
# rtkit-daemon: Supervising 9 threads of 2 processes of 1 users.
