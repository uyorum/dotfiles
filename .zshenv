export PATH="/sbin:$PATH"
if [ -d "$HOME/bin" ]; then
  for dir in $(find $HOME/bin -type d); do
    export PATH="$dir:$PATH"
  done
fi

# common functions
export PATH="$HOME/.zsh/lib:$PATH"

export LESS="-R"

export FZF_DEFAULT_OPTS="--select-1 --exit-0 --reverse"

## C-wで削除するときに区切り文字と見なさない記号のリスト
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>+"

# coreutils and findutils for OSX
if in-path -q brew; then
  for pkg in coreutils findutils gnu-sed; do
    if [ -d $(brew --prefix ${pkg}) ]; then
      export PATH="$(brew --prefix ${pkg})/libexec/gnubin:$PATH"
      export MANPATH="$(brew --prefix ${pkg})/libexec/gnuman:$MANPATH"
    fi
  done
fi

# Go
# Commands made with golang are needed some situations. so setup for golang in zshenv instead of zshrc
if in-path -q go; then
  export GOPATH="$HOME/.go"
  mkdir -p $GOPATH/{bin,pkg,src}
  export PATH="$GOPATH/bin:$PATH"
  # Windows needs to set environment variables: GOPATH to $GOPATH and PATH to $GOPATH/bin
fi
