#!/bin/bash
set -e
set -x

#mkdir /tmp/ricty-build
#
#sudo apt-get install fontforge -y
#
#wget http://levien.com/type/myfonts/Inconsolata.otf -O /tmp/ricty-build/Inconsolata.otf
#
#cp /tmp/ricty-build/Inconsolata.otf ~/.fonts
#
#MIG_DL_URL='http://sourceforge.jp/frs/redir.php?m=iij&f=%2Fmix-mplus-ipa%2F59022%2Fmigu-1m-20130617.zip'
#wget $MIG_DL_URL -O /tmp/ricty-build/migu-1m.zip
unzip /tmp/ricty-build/migu-1m.zip -d /tmp/ricty-build
cp /tmp/ricty-build/migu-1m-*/*.ttf ~/.fonts
#
#git clone git://github.com/yascentur/Ricty.git /tmp/ricty-build/ricty-build.git
fc-cache -fv
/tmp/ricty-build/ricty-build.git/ricty_generator.sh auto
