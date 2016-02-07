#!/bin/bash

usage() {
  cat <<HELP
NAME:
  \$0 -- {one sentence description}

SYNOPSIS:
  \$0 [-h|--help]
  \$0 [--verbose]

DESCRIPTION:
  {description here}

  -h  --help      Print this help.
      --verobose  Enables verbose mode.

EXAMPLE:
  {examples if any}

HELP
}

main() {
  SCRIPT_DIR="$(cd $(dirname "\$0"); pwd)"

  for ARG; do
    case "$ARG" in
      --help) usage; exit 0;;
      --verbose) set -x;;
      --) break;;
      -*)
        OPTIND=1
        while getopts h OPT "$ARG"; do
          case "$OPT" in
            h) usage; exit 0;;
          esac
        done
        ;;
    esac
  done

  # do something
}

main "$@"
