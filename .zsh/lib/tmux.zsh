# Functions about tmux

in-tmux() {
  if [ "$TMUX" != "" ]; then
    # in tmux
    return 0
  fi
  return 1
}

tmux-detached() {
  if tmux has-session >/dev/null 2>&1 && tmux list-sessions; then
    # detached session exists
    return 0
  fi
  return 1
}

run-tmux() {
  if ! which tmux >/dev/null; then
    echo "tmux: not found."
    return 1
  fi
  if in-tmux; then
    echo "You are in tmux."
    return 0
  elif tmux-detached; then
    # detached session exists
    echo -n "tmux attach?: (Y/n/session no.) "
    read
    if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
      tmux attach-session
      return
    elif tmux list-sessions | grep -q "^$REPLY:"; then
      tmux attach -t "$REPLY"
      return
    fi
  else
    # tmux is not running
    tmux new-session
  fi
}
