#!/usr/bin/env bash
DEVICE_NAME="ELAN1301:00 04F3:3035 Touchpad"
PROP="Tapping Enabled"
if xinput list | grep -qw "$DEVICE_NAME"; then
    DEVICE_ID=14
    PROP_ID=299
    DEVICE_NAME="ELAN1301:00 04F3:3035 Touchpad"

    set -x
    xinput set-prop $DEVICE_ID $PROP_ID 1
    set +x
fi