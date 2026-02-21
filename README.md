
## Mem oabount submodules

### How to get the status of submodules

```
git submodule status
```
* `-` → 初期化されていない（clone/fetchされてない）
* `+` → チェックアウトされてるが、記録されたコミットと異なる

if not cloned, 

### How to clone in existing repo
```
git submodule update --init --recursive
```

