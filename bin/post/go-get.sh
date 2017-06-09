#!/bin/zsh

packages="github.com/dougm/goflymake
github.com/nsf/gocode
golang.org/x/tools/cmd/goimports
github.com/golang/lint/golint"

which go >/dev/null || exit 0

for package in $(echo $packages | tr '\n' ' '); do
  echo "Installing $package..."
  go get -u $package &
done
wait
