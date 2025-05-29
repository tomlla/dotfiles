alias sq='sudo shutdown -h now'
# alias ssp='sudo systemctl suspend' # moved to ~/dotfiles/bin/ssp
alias v='vim -u NONE'
alias nv='nvim'

if [ $uname_value = 'Darwin' ]; then
  alias ls='ls -G -F' # Mac
else
  # Linux
  alias ls='ls --color=auto -F --time-style=long-iso'
fi
alias ll='ls -l'
alias la='ls -a'

alias s=sudo
alias tm=tmux
alias psg="ps aux | grep "
alias ggl='w3m https://google.com'
alias flux="xflux -l 35 -g 139"
alias wa="/usr/bin/watch"

# === Archlinux ===
alias yay-Syuu-noconfirm="yay -Syuu --noconfirm"
alias p='sudo pacman'
# alias yao=yaourt


## === Xwindow ===
if [ "$uname_value" = "Linux" ]; then
    alias pbcopy='xsel --clipboard --input'
fi

# === Dev Tools===
alias mt=multitail
alias g=git
# alias cci=circleci
alias dk=docker
alias dkc='docker compose'
alias h=heroku
alias psysh=~/.config/composer/vendor/bin/psysh
alias gr=./gradlew
alias pn=pnpm
alias aq=aqua



# === k8s
alias k=kubectl
alias kn=kubens
function kubectl-set-ns() {
  kubectl config set-context $(kubectl config current-context) --namespace=$1
}
function kubectl-get-ns() {
  kubectl config view | grep namespace
}

# === Ruby & Rails ===
alias be='bundle exec'
alias rac='bundle exec rails c'
alias racs='bundle exec rails c --sandbox'
alias ras='bundle exec rails s'
alias rbo='bundle exec rubocop'

## === Rust ===
alias ca=cargo
alias caw='cargo watch -x'
#     alias gcl-interactive="gcloud alpha interactive"
