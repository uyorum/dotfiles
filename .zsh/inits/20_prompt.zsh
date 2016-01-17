# VCSの情報を取得するzshの関数 vcs_infoを使う
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# Prompt
case ${UID} in
  0)
    PROMPT="%F{red}%n@%m%# %f"
    ;;
  *)
    PROMPT="%F{cyan}%n@%m%# %f"
    ;;
esac
RPROMPT="%1(v|%F{green}%1v%f|) [%~]"
SPROMPT="correct: %R -> %r ? "
