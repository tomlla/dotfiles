#zmodload zsh/zprof && zprof

export GOPATH=~/dev

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
  $HOME/.cargo/bin(N-/)
  /Applications/Postgres.app/Contents/MacOS/bin(N-/)
)
typeset -U path

myuname=$(uname)
if [ $myuname = 'Linux' ]; then 
    #export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
    #export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
    [ -d $HOME/.linuxbrew ] && export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
fi
if [ $myuname = 'Darwin' ]; then
    export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

    # 10.11 (El Capitan) にしてから java 1.6がけされてるなくなったっぽいのでコメントアウト
    #export JAVA6_HOME="`/usr/libexec/java_home -v 1.6`"
    #export PLAY6_HOME=/opt/play-1.2.5.3
    export PLAY_REPO="$HOME/play_repo"
    export JAVA8_HOME="`/usr/libexec/java_home -v 1.8`"
    export PLAY8_HOME=/opt/play8/
fi

if [ -f $HOME/.local.zshenv ]; then
    source $HOME/.local.zshenv
fi

source ~/.dotfiles/zsh/http-status
