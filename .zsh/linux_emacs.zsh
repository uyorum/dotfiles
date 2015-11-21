run-emacs-daemon() {
  if ! which emacsclient >/dev/null; then
    echo "emacsclient: not found."
    return 1
  fi
  if [ $UID -eq 0 ]; then
    echo "root does not need Emacs"
    return 0
  fi
  if ! emacsclient -e "(version)" >/dev/null 2>&1; then
    echo "There is not emacs daemon. Starting..."
    emacs --daemon
  fi
}
run-emacs-daemon
