# Platform
case `uname` in
  Darwin)
    OS='osx'
    ;;
  Linux)
    OS='linux'
    ;;
  CYGWIN_NT*)
    OS='windows'
    ;;
  *)
    OS='unknown'
    ;;
esac

if [ -d "$HOME/bin" ]; then
  find $HOME/bin -type d | while read line; do
    export PATH="$line:$PATH"
  done
fi

export LANG=ja_JP.UTF-8
export PATH="/sbin:$PATH"
export LESS="-R"

export EDITOR="emacsclient -nw"
export VISUAL=$EDITOR

# workspace directory
export WORKSPACE=~/workspace
test -d $WORKSPACE || (mkdir -p $WORKSPACE && echo "Created $WORKSPACE as workspace")

## C-wで削除するときに区切り文字と見なさない記号のリスト
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>+"

# rbenv
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - zsh)"
fi

# golang
which go >/dev/null 2>&1
if [ $? -eq 0 ] && [ $OS != "windows" ]; then
  export GOPATH="$HOME/.go"
  mkdir -p $GOPATH
  export PATH="$GOPATH/bin:$PATH"
  # Windows needs to set environment variables: GOPATH to $GOPATH and PATH to $GOPATH/bin
fi

case $OS in
  osx)
    export EDITOR='~/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -nw'
    export VISUAL=$EDITOR
    ;;
esac
