alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias le='less'
if `which emacsclient >/dev/null`; then
  alias e='emacsclient -nw'
  alias ekill='emacsclient -e "(kill-emacs)"'
fi
alias ll='ls -l'
alias la='ls -A'
alias grep='grep --color=auto'

alias sudo='sudo -E'

alias nscript='script "$HOME/log/`date +"%Y-%m-%d-%H%M%S"`_`whoami`_$(hostname -s).log"'
alias gcommit='git commit -m "`date +"%Y/%m/%d-%H:%M"`_`whoami`@$(hostname -s)"'
mkwork() {
  local workdir=$WORKSPACE/`date +%Y%m%d`_$1
  mkdir -p $workdir && cd $workdir
}

alias be='bundle exec'

# ghq
ghq-cd() {
  cd `ghq list -p | peco` >/dev/null
}
zle -N ghq-cd
bindkey '^]' ghq-cd

case $OS in
  osx)
    alias ls='ls -G'
    alias emacs='~/Applications/Emacs.app/Contents/MacOS/bin/emacs'
    alias emacsclient='~/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
    alias e='emacsclient -n'
    ;;
  linux)
    alias ls='ls --color=auto'
    ;;
  windows)
    alias ls='ls --color=auto'
    alias tmux='rm -rf /tmp/tmux* ; tmux'
    alias open='cygstart'
    ;;
  *)
    ;;
esac
