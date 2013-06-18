#!/bin/sh
set -x
currentdir=$(cd `dirname $0`; pwd)
dotfilespath=~/.dotfiles

ln -s $currentdir $dotfilespath
ln -s $dotfilespath/.tmux.conf .tmux.conf
ln -s $dotfilespath/.zshrc .zshrc
ln -s $dotfilespath/.gitconfig .gitconfig
ln -s $dotfilespath/.aliasrc .aliasrc

#x
#ln -s $HOME/dotfiles/x/.gtkrc-2.0 $HOME/.gtkrc-2.0
