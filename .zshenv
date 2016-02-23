# zmodload zsh/zprof && zprof
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
# - PATHではなくpath を使うこと
# - exportはしないこと path があとでPATHに含まれる
path=(
  $HOME/bin(N-/)
  $HOME/note/shscript/bin(N-/)
  $HOME/.dotfiles/bin(N-/)
  /opt/play(N-/)
  /opt/eclipse/eclipse(N-/)
  $HOME/.linuxbrew/bin(N-/)
  $GOPATH/bin(N-/)
  $path
  $(npm bin -g 2>/dev/null)
  $HOME/packer(N-/)
  /opt/kotlinc/bin(N-/)
  $HOME/.pyenv/bin(N-/)
  /usr/local/sbin(N-/)
)
typeset -U path

if [ "$(uname)" = 'Linux' -a -d $HOME/.linuxbrew ]; then
    export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
fi

if [ -f $HOME/.local.zshenv ]; then
    source $HOME/.local.zshenv
fi
