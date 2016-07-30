# zplug
export ZPLUG_HOME=$HOME/.zsh/zplug
source ${ZPLUG_HOME}/zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "rimraf/k"
zplug "zsh-users/zaw"

# init-loader numbering
# 00    00_ssh.zsh
# 01-30 my configurations
# 31-60 plugins
# 80    80_aliases.zsh
export ZSH_INIT_DIR=$HOME/.zsh/inits
zplug "uyorum/zsh-init-loader"

if ! zplug check; then
  zplug install
fi

zplug load

# Run tmux
run-tmux
