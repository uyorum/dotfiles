alias ls='ls --color=auto'

# set current directry as screen title and auto `ls` after `cd`↲
function chpwd() {
  ls --color=auto
  if [ "$TERM" = "screen" ]; then
    echo -n "k[`basename $PWD`]\\"
  fi
}
