alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias le='less'
if in-path -q emacsclient; then
  alias e='emacsclient -nw'
  alias ekill='emacsclient -e "(kill-emacs)"'
fi
alias ll='ls -l'
alias la='ls -A'
alias grep='grep --color=auto'

alias sudo='sudo -E'

alias nscript='script "$HOME/log/`date +"%Y-%m-%d-%H%M%S"`_`whoami`_$(hostname -s).log"'

alias gcommit='git commit -m "`date +"%Y/%m/%d-%H:%M"`_`whoami`@$(hostname -s)"'

# ghq
ghq-cd() {
  cd `ghq list -p | peco` >/dev/null
}
zle -N ghq-cd
bindkey '^]' ghq-cd

# Git
alias g='git'
alias gi='git'
alias gs='git status'
alias gc='git checkout'

# Ruby
alias be='bundle exec'
