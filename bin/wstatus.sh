#/usr/bin/env sh

set -u
set -e
set -x

function get_status() {
  local SSID=$1
  local WL_NETDEV_NAME=$(ip addr | grep ': w' |cut -d: -f2 | tr -d " ")
  echo "SSID: ${SSID} DEVICE: ${WL_NETDEV_NAME}"
  sudo iwlist $WL_NETDEV_NAME scan | grep -e $SSID
}

get_status rs500k-bf5145-3
