#!/usr/bin/env zsh

echo "Installing tmux plugins..."

tmux_dir="$HOME/.tmux"

mkdir -p "${tmux_dir}/plugins"
cd ${tmux_dir}/plugins
if [ -d "${tmux_dir}/plugins/tpm/.git" ]; then
  echo "tpm seems to be already cloned"
  echo "Updating it..."
  (cd tpm; git pull)
else
  git clone https://github.com/tmux-plugins/tpm
fi

echo "To install all plugins, press \`Prefix + I\` in tmux"
