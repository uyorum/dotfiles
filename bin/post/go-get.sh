#!/bin/zsh

packages="github.com/dougm/goflymake
github.com/nsf/gocode
github.com/peco/peco/cmd/peco
github.com/motemen/ghq
github.com/spf13/hugo"

which go >/dev/null || exit 0

for package in $(echo $packages | tr '\n' ' '); do
  echo "Installing $package..."
  go get -u $package
done
