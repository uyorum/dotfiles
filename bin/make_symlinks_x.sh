#!/bin/bash

while read line; do
  ln -s $line
done <<-EOF
  dotfiles/.Xdefaults $HOME
  dotfiles/.Xmodmap $HOME
  dotfiles/.Xresources $HOME
  dotfiles/.vimperatorrc $HOME
  dotfiles/.xmonad $HOME
EOF
