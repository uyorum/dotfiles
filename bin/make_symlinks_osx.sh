#!/bin/bash

while read line; do
  ln -s $line
done <<-EOF
  dotfiles/.berkshelf $HOME
  dotfiles/.emacs.d $HOME
  dotfiles/.gemrc $HOME
  dotfiles/.gitconfig $HOME
  dotfiles/.gitignore.global $HOME
  dotfiles/.globalrc $HOME
  dotfiles/.kitchen $HOME
  dotfiles/.tmux.conf $HOME
  dotfiles/.vim $HOME
  dotfiles/.vimperatorrc $HOME
  dotfiles/.vimrc $HOME
  dotfiles/.zsh $HOME
  dotfiles/.zshenv $HOME
  dotfiles/.zshrc $HOME
EOF
