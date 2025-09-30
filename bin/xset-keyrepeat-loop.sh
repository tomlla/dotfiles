#!/usr/bin/env bash
waittime=${1:-10}
echo "waittime=$waittime"
while true; do
    set -x
    xset r rate 160 60
    sleep $waittime
    set +x
done
