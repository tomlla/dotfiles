# zmodload zsh/zprof && zprof
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
# - PATHではなくpath を使うこと
# - exportはしないこと path があとでPATHに含まれる
typeset -U path
path=(
  $HOME/bin(N-/)
  $HOME/note/shscript/bin(N-/)
  /opt/play-1.2.7(N-/)
  /opt/eclipse/eclipse(N-/)
  $HOME/.linuxbrew/bin(N-/)
  $path
)
if [ -d $HOME/.linuxbrew ]; then
    export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
fi

if [ -d $HOME/.local.zshenv ]; then
    source $HOME/.local.zshenv
fi
