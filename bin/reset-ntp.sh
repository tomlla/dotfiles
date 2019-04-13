#!/usr/bin/env bash

set -e

sc() {
    sudo systemctl $2 $1
}
sc ntpd stop
sudo ntpdate 0.jp.pool.ntp.org
sc ntpd start


# See also
# https://qiita.com/Gen_Arch/items/da296b7cbe5d87abc5a4#%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E3%82%AF%E3%83%AD%E3%83%83%E3%82%AF%E3%81%AE%E6%9B%B4%E6%96%B0
#
# システムクロックの更新
# systemd-timesyncd を使ってシステムクロックを設定
# 
# timedatectl set-ntp true
# サービスの状態確認
# timedatectl status
