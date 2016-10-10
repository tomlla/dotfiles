# Setup fzf
# ---------
if [[ ! "$PATH" == */home/vagrant/.fzf/bin* ]]; then
  export PATH="$PATH:/home/vagrant/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */home/vagrant/.fzf/man* && -d "/home/vagrant/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/vagrant/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/vagrant/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/vagrant/.fzf/shell/key-bindings.zsh"

