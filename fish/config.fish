# vim: ft=sh

set --export JAVA_HOME /opt/java/java-home-symlink
set --export GOPATH ~/dev

set -x PATH \
    /usr/local/bin \
    /opt/bin \
    /opt/yarn-global/bin \
    /opt/java/java-home-symlink/bin \
    /opt/sbt/bin \
    ~/.dotfiles/bin \
    ~/.anyenv/bin \
    ~/dev/bin \
    $HOME/.cargo/bin \
    $PATH

status --is-interactive; and source (anyenv init -|psub)

# === alias:archlinux ===
alias p "sudo pacman"
alias yao "yaourt"

# === alias:rails ===
# alias be "bundle exec"

# === alias:linux ===
alias pbcopy "xsel --clipboard --input"
alias vi-fishrc "vim ~/.config/fish/config.fish"

alias g "git"
alias dk "docker"
alias dkc "docker-compose"
alias cci "circleci"

# functions
function mkcd
    mkdir $argv
    and cd $argv
end

function fish_prompt
  if [ $status -eq 0 ]
    # set status_face (set_color green)"(*'-') "
    set status_face (set_color green)"\$ "
  else
    # set status_face (set_color blue)"(*;-;) "
    set status_face (set_color blue)"\$ "
  end

  set current_branch_name (set_color cyan)(git rev-parse --abbrev-ref HEAD 2> /dev/null)

  set prompt (set_color yellow)(prompt_pwd)

  echo $prompt $current_branch_name
  echo $status_face
end

# In default, this file is not loaded.
# if you need `set -U IMINGCP true` for using GCP
if [ $IMINGCP ]
    if [ -f '/home/nt/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/home/nt/google-cloud-sdk/path.fish.inc'; else; . '/home/nt/google-cloud-sdk/path.fish.inc'; end; end
end
