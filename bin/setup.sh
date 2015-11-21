#!/bin/bash

if ! which git >/dev/null; then
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
    bin/make_symlinks_osx.sh
    ;;
  Linux)
    bin/make_symlinks_lin.sh
    ;;
  CYGWIN_NT*)
    bin/make_symlinks_win.bat
    ;;
  *)
    ;;
esac

popd
