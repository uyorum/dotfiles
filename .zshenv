# Don't load /etc/zprofile and /etc/zlogin
setopt no_global_rcs
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

if [ -d "$HOME/bin" ]; then
  for dir in $(find $HOME/bin -type d); do
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
