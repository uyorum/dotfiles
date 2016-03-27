alias tmux='rm -rf /tmp/tmux* ; tmux'
alias open='cygstart'

sudo() {
  local executable=$(which "${1:-cmd}")
  shift
  /usr/bin/cygstart --action=runas "$executable" "$@"
}
