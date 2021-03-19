#!/usr/bin/env zsh
install_path=$HOME/bin

mkdir -p ${install_path}
curl -sfL https://direnv.net/install.sh | bin_path=${install_path} bash
