#!/bin/bash

readonly PROGNAME=$(basename \$0)
readonly PROGDIR=$(readlink -m $(dirname \$0))

usage() {
  cat <<HELP
NAME:
  $PROGNAME - {one sentence description}

SYNOPSIS:
  $PROGNAME [-h|--help]
  $PROGNAME [-v|--verbose]

DESCRIPTION:
  {detailed description}

  -h  --help      Print this help.
  -v  --verbose   Enables verbose mode.

EXAMPLE:
  {examples if any}

HELP
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
        echo "$PROGNAME: illegal option -- '$(echo \$1 | sed 's/^-*//')'" 1>&2
        exit 1
        ;;
      *)
        if [[ ! -z "\$1" ]] && [[ ! "\$1" =~ ^-+ ]]; then
          args+=( "\$1" )
          shift 1
        fi
        ;;
    esac
  done

  local required_args=0
  # Check number of arguments
  if [ ! $required_args == 0 ] && [ "\${args[$(expr $required_args - 1)]}" == "" ]; then
    echo "$PROGNAME: too few arguments" 1>&2
    echo "Try '$PROGNAME --help' for more information." 1>&2
    exit 1
  fi

  # Arguments are in \${args[@]}
}

main "$@"
