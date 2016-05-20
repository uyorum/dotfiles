alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias le='less'
if in-path -q emacsclient; then
  alias e='emacsclient -n'
  alias ekill='emacsclient -e "(kill-emacs)"'
fi
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'

# set current directry as screen title and auto `ls` after `cd`↲
function chpwd() {
  ls --color=auto
  if [ "$TERM" = "screen" ]; then
    echo -n "k[`basename $PWD`]\\"
  fi
}

alias grep='grep --color=auto'

alias sudo='sudo -E'

alias nscript='script "$HOME/log/`date +"%Y-%m-%d-%H%M%S"`_`whoami`_$(hostname -s).log"'

alias gcommit='git commit -m "`date +"%Y/%m/%d-%H:%M"`_`whoami`@$(hostname -s)"'

# ghq
ghq-cd() {
  echo
  cd $(ghq list -p | peco)
}
zle -N ghq-cd
bindkey '^]' ghq-cd

# Docker
alias dc='docker-compose'
alias dm='docker-machine'

# Git
alias g='git'
alias gi='git'
alias gs='git status'
alias gc='git commit'
alias gco='git checkout'

# Ruby
alias be='bundle exec'
