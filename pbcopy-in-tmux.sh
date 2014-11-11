
brew install reattach-to-usernamespace
```
bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"
```
を追加する

http://blog.pg1x.com/entry/2014/08/22/200000

http://qiita.com/upinetree/items/cd80bc7865c52091be10
こっちには tmux上で起動したvimのクリップボード共有 も書いてある

