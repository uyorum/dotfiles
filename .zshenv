if [ -d "$HOME/bin" ]; then
  find $HOME/bin -type d | while read line; do
    export PATH="$line:$PATH"
  done
fi

export LANG=ja_JP.UTF-8
export PATH="/sbin:$PATH"
export LESS="-R"

export EDITOR="emacsclient -nw"
export VISUAL="$EDITOR"

## C-wで削除するときに区切り文字と見なさない記号のリスト
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>+"

# rbenv
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - zsh)"
fi

# golang
if `which go >/dev/null`; then
  export GOPATH="$HOME/.go"
  mkdir -p $GOPATH
  export PATH="$GOPATH/bin:$PATH"
  # Windows needs to set environment variables: GOPATH to $GOPATH and PATH to $GOPATH/bin
fi
