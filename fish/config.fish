# myuscripts
set --export PATH $PATH /opt/bin ~/.dotfiles/bin

# yarn
set --export PATH $PATH /opt/yarn-global/bin

# anyenv
set --export PATH $PATH $HOME/.anyenv/bin
anyenv init - fish | source

# java (jenv tukaitai)
set --export PATH $PATH  /opt/j/jdk1.8.0_131/bin
set --export JAVA_HOME /opt/j/jdk1.8.0_131


# === alias ===
alias g "git"
alias p "sudo pacman"
alias wh "which"
alias fi "file"
alias s "sudo"

alias fr "fisher"
alias yao "yaourt"
alias pbcopy "xsel --clipboard --input"