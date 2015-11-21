#!/bin/bash

if which git >/dev/null; then
  echo "command not found: git"
  exit 1
fi

pushd $HOME
git clone git@github.com:uyorum/dotfiles
cd dotfiles
git submodule init
git submodule update

case `uname` in
  Darwin)
    dotfiles/bin/make_symlinks_osx.sh
    ;;
  Linux)
    dotfiles/bin/make_symlinks_lin.sh
    ;;
  CYGWIN_NT*)
    dotfiles/bin/make_symlinks_win.bat
    ;;
  *)
    ;;
esac

popd
