alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias le='less'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'

# set current directry as screen title and auto `ls` after `cd`
function chpwd() {
  ls --color=auto
  if [ "$TERM" = "screen" ]; then
    echo -n "k[`basename $PWD`]\\"
  fi
}

alias grep='grep --color=auto'
alias sudo='sudo -E'
alias nscript='script "$HOME/log/`date +"%Y-%m-%d-%H%M%S"`_`whoami`_$(hostname -s).log"'

alias g='git'
alias gc='anyframe-widget-checkout-git-branch'
alias gs='anyframe-widget-insert-git-branch'

# Ruby
alias be='bundle exec'
