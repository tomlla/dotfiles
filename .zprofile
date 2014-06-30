# 2014/06/30 18:48
# nt@phoenix は 開発環境なのでsystemwideにrbenvをインストールしない事にする
#
#set -x


## rbenv install, and def RBENV_ROOT, rbenv
export RBENV_ROOT=$HOME/.rbenv

[ -d "$RBENV_ROOT" ] || \
  git clone git://github.com/sstephenson/rbenv.git $RBENV_ROOT

mkdir -p $RBENV_ROOT/plugins
[ -d "$RBENV_ROOT/plugins/ruby-build" ] || \
  git clone git://github.com/sstephenson/ruby-build.git $RBENV_ROOT/plugins/ruby-build

export PATH=$RBENV_ROOT/bin:$PATH
eval "$(rbenv init -)"



