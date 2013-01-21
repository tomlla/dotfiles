# Set up the prompt
 autoload -Uz promptinit
 promptinit
 prompt walters

 #PATH setting
 PATH=$HOME/bin:/usr/local/bin:$PATH
 export MANPATH=/usr/local/share/man:/usr/local/man:/usr/share/man
 #Language setting
 export LANG=ja_JP.UTF-8
 #export LANG=ja_JP.eucJP

 # Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
 HISTSIZE=1000
 SAVEHIST=1000
 HISTFILE=~/.zsh_history

 # Use emacs keybindings even if our EDITOR is set to vi
 bindkey ";5C" forward-word
 bindkey ";5D" backward-word


 #--- 履歴関連 --#
 # 履歴ファイルに時刻を記録
 setopt extended_history

# Use modern completion system
	autoload -Uz compinit
	compinit
	zstyle ':completion:*' auto-description 'specify: %d'
	zstyle ':completion:*' completer _expand _complete _correct _approximate
	zstyle ':completion:*' format 'Completing %d'
	zstyle ':completion:*' group-name ''
	zstyle ':completion:*' menu select=2
	eval "$(dircolors -b)"
	zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
	zstyle ':completion:*' list-colors ''
	zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
	zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
	zstyle ':completion:*' menu select=long
	zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
	zstyle ':completion:*' use-compctl false
	zstyle ':completion:*' verbose true
	zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
	zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
	zstyle ':completion:*' use-cache true

#sudo でも補完の対象
 zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
#ファイルリスト補完でもlsと同様に色をつける｡
 zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# VCS and Prompt settings
autoload -Uz vcs_info
precmd() {
  psvar=()
 	 LANG=en_US.UTF-8 vcs_info
 	 psvar[1]=$vcs_info_msg_0_
}
PROMPT=$'%2F%n@%m%f %1v\n%# '

	# 関数
	find-grep () { find . -type f -print | xargs grep -n --binary-files=without-match $@ }

	 # 補完候補が複数ある時に、一覧表示
	 setopt auto_list
	 # 保管結果をできるだけ詰める
	 setopt list_packed
	 # 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完
	 #setopt auto_menu
	 # カッコの対応などを自動的に補完
	 setopt auto_param_keys
	 # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
	 setopt auto_param_slash
	 # auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示しない
	 setopt no_list_types

	 # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
	 setopt magic_equal_subst

	 # ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
	 setopt mark_dirs

	 # ビープ音を鳴らさないようにする
	 setopt no_beep
	 # cdのタイミングで自動的にpushd
	 setopt auto_pushd

	 # 複数の zsh を同時に使う時など history ファイルに上書きせず追加
	 setopt append_history
	 # 直前と同じコマンドラインはヒストリに追加しない
	 setopt hist_ignore_dups
	 # ヒストリにhistoryコマンドを記録しない
	 setopt hist_no_store
	 # 余分なスペースを削除してヒストリに記録する
	 setopt hist_reduce_blanks
	 # 行頭がスペースで始まるコマンドラインはヒストリに記録しない
	 #setopt hist_ignore_spece
	 # 重複したヒストリは追加しない
	 setopt hist_ignore_all_dups
	 # ヒストリを呼び出してから実行する間に一旦編集できる状態になる
	 setopt hist_verify

	 # 8 ビット目を通すようになり、日本語のファイル名を表示可能
	 setopt print_eight_bit

	 # シェルのプロセスごとに履歴を共有
	 setopt share_history

	 # Ctrl+wで､直前の/までを削除する｡
	 WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

	 # cd をしたときにlsを実行する
	 function chpwd() { ls }
	 # ディレクトリ名だけで､ディレクトリの移動をする｡
	 setopt auto_cd

	 # C-s, C-qを無効にする。
	 setopt no_flow_control

 #ls color setting
	 LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:ex=01;32:*.tar=01;31"
	 export LS_COLORS
	 alias tvi='vim.tiny -u .tiny_vimrc'
 alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'

	 # git completion
	  gitcompfile=$HOME/dotfiles/git-completion.bash
	  if [ -f $gitcompfile ]; then
			autoload bashcompinit
			bashcompinit
			source $gitcompfile
	  fi

if [ -f ~/.aliasrc ]; then
    source ~/.aliasrc
fi
if [ -f ~/.local_shrc ]; then
    source ~/.local_shrc
fi
if [ -f ~/.local_zshrc ]; then
  source ~/.local_zshrc
fi
