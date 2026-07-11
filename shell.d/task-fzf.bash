# Use Ctrl + t, to run
_task-fzf() {
  local task_line=$(
      task --list-all --json \
      | jq -r '.tasks[] |
              if (.desc|length) > 0 then
                  "\(.name) \t # \(.desc)"
              else
                  .name
              end
              ' \
      | fzf
  )
  [ -z "$task_line" ] && return
  task_name=$(echo $task_line | awk '{print $1}')
  echo task_name=$task_name
  READLINE_LINE="task $task_name"
  READLINE_POINT=${#READLINE_LINE}
}
bind -x '"\C-t": "_task-fzf"'

