#!/bin/sh

set -e 
set -x 

PLUGIN_NAME=connectFileShare
VER=1.0

fileshare_dir=~/backlog/fileshare
dest=~/ghqroot/soliton.git.backlog.jp/TOMPROJECT/FileShareApiClinetSample/modules/$PLUGIN_NAME-$VER

play deployapi $PROJ_DIR
rm -rf $dest
unzip $fileshare_dir/dist/${PLUGIN_NAME}-${VER}.zip -d $dest
