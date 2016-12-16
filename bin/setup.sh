#!/bin/bash

readonly PROGNAME=$(basename $0)
readonly PROGDIR=$(readlink -m $(dirname $0))

usage() {
  cat <<HELP
NAME:
  $PROGNAME -- Set up for using my dotfiles

SYNOPSIS:
  $PROGNAME [-h|--help]
  $PROGNAME [-v|--verbose]

DESCRIPTION:
  This script sets up for using my dotfiles.

  For example:
    1. Clone dotfiles repository from GitHub.
    2. Make symbolic links to each files in home directory.

  -h  --help      Print this help.
  -v  --verbose   Enables verbose mode.

EXAMPLE:
  $PROGNAME

HELP
}

in-path() {
  local command="$1"
  if which "$command" >/dev/null 2>&1; then
    return 0
  fi

  echo "command not found: $command"
  return 1
}

clone_dotfiles() {
  local dest_dir="$1"
  cd ${dest_dir}
  git clone git@github.com:uyorum/dotfiles
  cd dotfiles
  git submodule init
  git submodule update
}

make_link() {
  local dotfiles_dir="$1"
  for f in $(ls -A1 ${dotfiles_dir} | egrep -v -e '^\.git$' -e '^\.gitignore$' -e '^\.gitmodules$' -e '^\.linux$' -e '^\.windows$' -e '^\.macos$' -e '^[^.]'); do
    ln -s ${dotfiles_dir}/${f} ${HOME}
  done
}

exec_post_scripts() {
  local dotfiles_dir="$1"
  local post_dir="${dotfiles_dir}/bin/post"

  for f in $(ls -1 ${post_dir}); do
    ${post_dir}/${f} &
  done
  wait
}

main() {
  for OPT in "$@"; do
    case "$OPT" in
      '-h'|'--help')
        usage
        exit 0
        ;;
      '-v'|'--verbose')
        set -x
        shift
        ;;
      '--')
        shift
        args=( "$@" )
        break
        ;;
      -*)
        echo "$PROGNAME: illegal option -- '$(echo $1 | sed 's/^-*//')'" 1>&2
        exit 1
        ;;
      *)
        if [[ ! -z "$1" ]] && [[ ! "$1" =~ ^-+ ]]; then
          args+=( "$1" )
          shift 1
        fi
        ;;
    esac
  done

  local required_args=0
  # Check number of arguments
  if [ ! $required_args == 0 ] && [ "${args[$(expr $required_args - 1)]}" == "" ]; then
    echo "$PROGNAME: too few arguments" 1>&2
    echo "Try '$PROGNAME --help' for more information." 1>&2
    exit 1
  fi

  # check required commands are in PATH
  for c in "git"; do
    in-path ${c} || exit 1
  done

  readonly DEST="$HOME"

  clone_dotfiles "$DEST"

  # For Linux
  if [[ $(uname) =~ Linux ]]; then
    make_link "$DEST/dotfiles/.linux"
  fi

  # For Windows
  if [[ $(uname) =~ CYGWIN ]]; then
    # make symbolic links with Windows function instead of CYGWIN's "ln"
    export CYGWIN="winsymlinks $CYGWIN"
    # sym-link of which location is not HOME
    ln -s $DEST/dotfiles/.windows/AutoHotkey.ahk $(cygpath -u $USERPROFILE)/Documents/
  fi

  # For MacOS
  if [[ $(uname) =~ Darwin ]]; then
    # Karabinier
    local karabinier_dir="$HOME/Library/Application Support/Karabiner"
    test -d "$karabinier_dir" || mkdir -p "$karabinier_dir"
    ln -s $DEST/dotfiles/.macos/karabinier/private.xml "$karabinier_dir"
  fi

  make_link "$DEST/dotfiles"

  exec_post_scripts "$DEST/dotfiles"
}

main "$@"
