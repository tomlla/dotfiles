# vim: ft=sh

# set -U fish_user_paths $fish_user_paths \
#     /usr/local/bin \
#     /opt/bin \
#     /opt/yarn-global/bin \
#     /opt/java/java-home-symlink/bin \
#     /opt/sbt/bin \
#     ~/.dotfiles/bin \
#     ~/.anyenv/bin \
#     ~/dev/bin \
set -x PATH \
    /usr/local/bin \
    /opt/bin \
    /opt/yarn-global/bin \
    /opt/java/java-home-symlink/bin \
    /opt/sbt/bin \
    ~/.dotfiles/bin \
    ~/.anyenv/bin \
    ~/dev/bin \
    $PATH

# java
set --export JAVA_HOME /opt/java/java-home-symlink
# go
set --export GOPATH ~/dev

anyenv init - fish | source

# === alias:linux ===
alias g "git"
alias wh "which"
alias fi "file"
alias s "sudo"
alias t tmux

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

# ===== docker ======
alias dk "docker"
# ===== circleci ======
alias cci "circleci"

# functions
function mkcd
    mkdir $argv
    and cd $argv
end

function fish_prompt
  if [ $status -eq 0 ]
    set status_face (set_color green)"(*'-') "
  else
    set status_face (set_color blue)"(*;-;) "
  end

  set current_branch_name (set_color 62A)(git rev-parse --abbrev-ref HEAD 2> /dev/null)

  set prompt (set_color yellow)(prompt_pwd)

  echo $prompt $current_branch_name
  echo $status_face
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/nt/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/home/nt/google-cloud-sdk/path.fish.inc'; else; . '/home/nt/google-cloud-sdk/path.fish.inc'; end; end
