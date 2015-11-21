@echo off

mklink /D %HOME%\.emacs.d %HOME%\dotfiles\.emacs.d
mklink /D %HOME%\.vim %HOME%\dotfiles\.vim
mklink %HOME%\.gemrc %HOME%\dotfiles\.gemrc
mklink %HOME%\.gitconfig %HOME%\dotfiles\.gitconfig
mklink %HOME%\.tmux.conf %HOME%\dotfiles\.tmux.conf
mklink %HOME%\.vimperatorrc %HOME%\dotfiles\.vimperatorrc
mklink %HOME%\.vimrc %HOME%\dotfiles\.vimrc
mklink %HOME%\.zshenv %HOME%\dotfiles\.zshenv
mklink %HOME%\.zshrc %HOME%\dotfiles\.zshrc
mklink %HOME%\Documents\AutoHotkey.ahk %HOME%\dotfiles\.windows\AutoHotkey.ahk
