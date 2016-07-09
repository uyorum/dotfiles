# Don't load /etc/zprofile and /etc/zlogin
setopt no_global_rcs
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

if [ -d "$HOME/bin" ]; then
  for dir in `find $HOME/bin -type d`; do
    export PATH="$dir:$PATH"
  done
fi

# common functions
export PATH="$HOME/.zsh/lib:$PATH"

export LANG=ja_JP.UTF-8
export PATH="/sbin:$PATH"
export LESS="-R"

export EDITOR="emacsclient -nw"
export VISUAL="$EDITOR"

## C-wで削除するときに区切り文字と見なさない記号のリスト
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>+"

# coreutils and findutils for OSX
if in-path -q brew; then
  for pkg in coreutils findutils; do
    if [ -d $(brew --prefix ${pkg}) ]; then
      export PATH="$(brew --prefix ${pkg})/libexec/gnubin:$PATH"
      export MANPATH="$(brew --prefix ${pkg})/libexec/gnuman:$MANPATH"
    fi
  done
fi

# Ruby
if [ -d "$HOME/.rbenv" ]; then
  export RBENV_ROOT="$HOME/.rbenv"
  export PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init - zsh)"
fi

# Python
# also needs "pyenv-virtualenv"
if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Go
if in-path -q go; then
  export GOPATH="$HOME/.go"
  mkdir -p $GOPATH
  export PATH="$GOPATH/bin:$PATH"
  # Windows needs to set environment variables: GOPATH to $GOPATH and PATH to $GOPATH/bin
fi
