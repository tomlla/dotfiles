# myuscripts
set --export PATH $PATH /opt/bin ~/.dotfiles/bin

# yarn
set --export PATH $PATH /opt/yarn-global/bin

# anyenv
set --export PATH $PATH $HOME/.anyenv/bin
anyenv init - fish | source

# java
set --export PATH $PATH  /opt/java/java-home-symlink/bin
set --export JAVA_HOME /opt/java/java-home-symlink

# go
set --export GOPATH ~/dev

# === alias:linux ===
alias g "git"
alias wh "which"
alias fi "file"
alias s "sudo"

# === alias:xorg ===
alias pbcopy "xsel --clipboard --input"

# === alias:fish ===
alias fsr "fisher"
alias vi-fishrc "vim ~/.config/fish/config.fish"

# === alias:archlinux ===
alias p "sudo pacman"
alias yao "yaourt"

# === alias:rails ===
alias be "bundle exec"

# === alias:js ===
alias yn "yarn"