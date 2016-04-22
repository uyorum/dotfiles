run-emacs-daemon() {
  in-path emacsclient || return 1

  if [ $UID -eq 0 ]; then
    echo "root does not need Emacs"
    return 0
  fi
  if ! emacsclient -e "(version)" >/dev/null 2>&1; then
    echo "There is not emacs daemon running. Starting..."
    emacs --daemon
  fi
}

# headless environment
[ -n $DISPLAY ] && run-emacs-daemon
[ -n $DISPLAY ] && alias e='emacsclient -nw'
