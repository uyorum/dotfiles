# anyframe
if zplug check mollifier/anyframe; then
  zstyle ":anyframe:selector:" use fzf

  # cd to ghq reposities
  # don't use enhancd
  anyframe-widget-cd-ghq-repository() {
    anyframe-source-ghq-repository \
      | anyframe-selector-auto \
      | anyframe-action-execute \\cd --
  }

  # cd to workspace
  anyframe-widget-cd-workspace() {
    find ${WORKSPACE}/ -mindepth 1 -maxdepth 1 -type d \
      | anyframe-selector-auto \
      | anyframe-action-execute \\cd --
  }
fi
