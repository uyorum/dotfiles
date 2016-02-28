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
  for f in $(ls -Ad1 ${dotfiles_dir}/.* | grep -v -e '.git' -e '.windows'); do
    ln -s ${f} ${HOME}
  done
}

setup_vimp_plugin() {
  local vimp_dir="$1"
  # use vimperator-plugins reposity
  mkdir -p ${vimp_dir}/plugin
  cd ${vimp_dir}
  git clone https://github.com/vimpr/vimperator-plugins
  # In Windows, symbolic link does not work
  cp vimperator-plugins/plugin_loader.js plugin/
  cat <<EOF > vimperator-plugins/.git/hooks/post-merge
#!/bin/bash

cp ${vimp_dir}/vimperator-plugins/plugin_loader.js ${vimp_dir}/plugin
EOF
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
  VIMP_DIR="$HOME/.vimperator"
  clone_dotfiles "$DEST"

  # For Windows
  if [[ `uname` =~ CYGWIN ]]; then
    # make symbolic links with Windows function instead of CYGWIN's "ln"
    export CYGWIN="winsymlinks $CYGWIN"
    VIMP_DIR="$HOME/vimperator"
    # sym-link of which location is not HOME
    ln -s $DEST/dotfiles/.windows/AutoHotkey.ahk $(cygpath -u $USERPROFILE)/Documents/
  fi

  make_link "$DEST/dotfiles"

  readonly VIMP_DIR
  setup_vimp_plugin "$VIMP_DIR"
}

main "$@"
