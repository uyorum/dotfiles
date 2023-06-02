# zplug
export ZPLUG_HOME=$HOME/.zplug
if [[ ! -d ${ZPLUG_HOME} ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi
source ${ZPLUG_HOME}/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "rimraf/k"
zplug "zsh-users/zaw"
zplug "zsh-users/zsh-completions"
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/gem", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "mollifier/anyframe"

export ZSH_INIT_DIR=$HOME/.zsh/inits
zplug "uyorum/zsh-init-loader", defer:3

if ! zplug check; then
  zplug install
fi
zplug load

[[ -e ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local

run-tmux
