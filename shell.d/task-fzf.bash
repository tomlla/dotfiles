# Use Ctrl + t, to run
_task-fzf() {
  local task_line task_name
  task_line=$(
      task --list-all --json \
      | jq -r '.tasks[] | "\(.name) \(.desc)"' \
      | fzf
  )
  [ -z "$task_line" ] && return
  echo task_name=$task_name
  READLINE_LINE="task $task_name"
  READLINE_POINT=${#READLINE_LINE}
}
bind -x '"\C-t": "_task-fzf"'

