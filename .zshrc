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
zplug "x-motemen/ghq", as:command, from:gh-r, rename-to:ghq
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "peco/peco", as:command, from:gh-r, rename-to:peco
zplug "b4b4r07/zsh-gomi", as:command, use:bin/gomi, on:junegunn/fzf-bin
zplug "Songmu/make2help", as:command, from:gh-r, rename-to:make2help
zplug "gohugoio/hugo", as:command, from:gh-r, rename-to:hugo, use:"*Linux*.tar.gz"
zplug "mollifier/anyframe", use:"anyframe.plugin.zsh", on:"junegunn/fzf-bin"
zplug "direnv/direnv", as:command, from:gh-r, rename-to:direnv

export ZSH_INIT_DIR=$HOME/.zsh/inits
zplug "uyorum/zsh-init-loader", defer:3

if ! zplug check; then
  zplug install
fi
zplug load

[[ -e ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local

run-tmux
