#!/usr/bin/env bash

set -e

sc() {
    sudo systemctl $2 $1
}
sc ntpd stop
sudo ntpdate 0.jp.pool.ntp.org
sc ntpd start
