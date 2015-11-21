# Backup directory for Emacs and Vim
[ -d ~/.backups ] || mkdir -p ~/.backups

#
# Completion
#
autoload -U compinit
compinit -u
#autoload predict-on
#predict-on
## 補完候補を矢印キーなどで選択出来るようにする
zstyle ':completion:*:default' menu select=1

#
# Terminal title
#
case "${TERM}" in
  kterm*|xterm)
    PROMPT_COMMAND='echo -e "\033]0;'"${USER}@${HOSTNAME%%.*}:"'${PWD}\007\c"'
    ;;
esac

#
# History
#
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
# ignore duplication command history list
setopt hist_ignore_dups
# share command history data
setopt share_history

#
# Others
#
# auto change directory↲
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd

# compacked complete list display
setopt list_packed

case "$OS" in
  "windows" | "linux")
    # set current directry as screen title and auto `ls` after `cd`↲
    function chpwd() {
      ls --color=auto
      if [ "$TERM" = "screen" ]; then
        echo -n "k[`basename $PWD`]\\"
      fi
    }
    ;;
  *)
    # set current directry as screen title and auto `ls` after `cd`↲
    function chpwd() {
      ls -G
      if [ "$TERM" = "screen" ]; then
        echo -n "k[`basename $PWD`]\\"
      fi
    }
esac
