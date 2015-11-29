# Emacs installed by Homebrew
if [ -d "$HOME/Applications/Emacs.app/Contents/MacOS/bin" ]; then
  export PATH="$HOME/Applications/Emacs.app/Contents/MacOS/bin:$PATH"
  alias e='emacsclient -nw'
  alias ekill='emacsclient -e "(kill-emacs)"'
fi
