#!/bin/zsh

packages="github.com/dougm/goflymake
github.com/nsf/gocode
github.com/peco/peco/cmd/peco
github.com/motemen/ghq
github.com/spf13/hugo
github.com/direnv/direnv
golang.org/x/tools/cmd/goimports
github.com/Songmu/make2help/cmd/make2help"

which go >/dev/null || exit 0

for package in $(echo $packages | tr '\n' ' '); do
  echo "Installing $package..."
  go get -u $package
done
