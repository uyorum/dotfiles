alias ls='ls -G'

# set current directry as screen title and auto `ls` after `cd`↲
function chpwd() {
  ls -G
  if [ "$TERM" = "screen" ]; then
    echo -n "k[`basename $PWD`]\\"
  fi
}
