#!/bin/sh
set -x
repositorypath=$(cd `dirname $0`; pwd)
symlinksourcepath=$HOME/.dotfiles

if [ "$repositorypath" = "$symlinksourcepath" ]; then
  echo "repository dir is $repositorypath (not create symlink.)"
else
  ln -s $repositorypath $symlinksourcepath
fi

cd $HOME
ln -s $symlinksourcepath/.tmux.conf .tmux.conf
ln -s $symlinksourcepath/.zshrc .zshrc
ln -s $symlinksourcepath/.gitconfig .gitconfig
ln -s $symlinksourcepath/.aliasrc .aliasrc
ln -s $symlinksourcepath/.pythonrc .pythonrc
ln -s $symlinksourcepath/.zprofile ~/.zprofile

#x
#ln -s $HOME/dotfiles/x/.gtkrc-2.0 $HOME/.gtkrc-2.0
