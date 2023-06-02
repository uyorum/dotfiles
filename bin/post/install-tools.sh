#!/usr/bin/env zsh
install_path=$HOME/bin
mkdir -p ${install_path}

# direnv
echo 'Installing direnv'
curl -sfL https://direnv.net/install.sh | bin_path=${install_path} bash

echo 'Install following tools manually'
echo 'https://github.com/x-motemen/ghq/releases'
echo 'https://github.com/junegunn/fzf/releases'
echo 'https://github.com/gohugoio/hugo/releases'
