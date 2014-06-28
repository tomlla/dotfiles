#!/bin/sh
# system wide な rbenv環境のインストール
#set -x
#set -e

[ ! -O / ] && echo "Error: Only super user can do this script." && exit 1

RBENV_ROOT=/usr/local/rbenv
RBENV_PROFILE=/etc/profile.d/rbenv.sh

[ -d "$RBENV_ROOT" ] || \
  git clone git://github.com/sstephenson/rbenv.git $RBENV_ROOT

mkdir -p $RBENV_ROOT/plugins
[ -d "$RBENV_ROOT/plugins/ruby-build" ] || \
  git clone git://github.com/sstephenson/ruby-build.git $RBENV_ROOT/plugins/ruby-build

echo "export RBENV_ROOT=$RBENV_ROOT" > $RBENV_PROFILE
echo "export PATH=$RBENV_ROOT/bin:$PATH" >> $RBENV_PROFILE
echo 'eval "$(rbenv init -)"' >> $RBENV_PROFILE

echo "rbenv installing may success."
echo "you have to do source $RBENV_PROFILE ; rbenv install <ruby version>"
