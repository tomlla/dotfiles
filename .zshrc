# Created by newuser for 5.0.2
#typeset -U path
#path=(
#  $HOME/bin(N-/)
#  $HOME/note/shscript/bin(N-/)
#  /opt/play-1.2.7
#  /opt/eclipse/eclipse
#  $path
#)

if [ -e /usr/share/terminfo/x/xterm+256color -o "$(uname)" = Darwin ]; then
	export TERM=xterm-256color #need to install ncurses or ncurses-term
fi

# setting about history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
# 履歴ファイルに時刻を記録
setopt extended_history
# シェルのプロセスごとに履歴を共有
setopt share_history
# 複数の zsh を同時に使う時など history ファイルに上書きせず追加
setopt append_history
# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups
# ヒストリにhistoryコマンドを記録しない
setopt hist_no_store
# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify

#sudo でも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/bin /usr/bin /sbin /bin
#ファイルリスト補完でもlsと同様に色をつける｡
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# 補完候補が複数ある時に、一覧表示
setopt auto_list
# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst
# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs
# ディレクトリ名だけで､ディレクトリの移動をする｡
setopt auto_cd
# Ctrl+wで､直前の/までを削除する｡
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# git completion
#fpath=(~/.dotfiles/completion $fpath)
autoload -U compinit
compinit -u

stty stop undef

# myfunctions
function mkcd(){ mkdir -p $1 && cd $1 }
function load_if_exist() { [ -f "$1" ] && source $1 }

# prompt
autoload -Uz vcs_info
precmd() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    #非gitディレクトリでgit user情報をだしたくないならコメントアウトを外すといいぜ
    #[ -n "$vcs_info_msg_0_" ] && \
        local vcs_user_info="$(git config user.name)<$(git config user.email)>"
    psvar[1]=$vcs_info_msg_0_"$vcs_user_info"
}
autoload -Uz promptinit
promptinit
prompt walters
PROMPT=$'%2F%n@%m%f %1v\n%# '

load_if_exist ~/.groovyrc
load_if_exist ~/.pythonrc
load_if_exist ~/.rubyrc
load_if_exist ~/.gorc
#load_if_exist ~/.android-developrc
load_if_exist ~/.local.shrc
load_if_exist ~/.local.aliasrc
load_if_exist ~/.aliasrc
load_if_exist ~/.dotfiles/zsh/*

#if (which zprof > /dev/null) ;then
#  zprof | less
#fi
