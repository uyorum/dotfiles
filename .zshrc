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

case $(uname -m) in
  'aarch64')
    # go get github.com/x-motemen/ghq
    zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf, use:"*linux_arm8*"
    zplug "mollifier/anyframe", use:"anyframe.plugin.zsh", on:"junegunn/fzf-bin"
    zplug "gohugoio/hugo", as:command, from:gh-r, rename-to:hugo, use:"*Linux-ARM64.tar.gz"
    zplug "direnv/direnv", as:command, from:gh-r, rename-to:direnv, use:"*linux-arm64"
    ;;
  *)
    zplug "x-motemen/ghq", as:command, from:gh-r, rename-to:ghq
    zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
    zplug "mollifier/anyframe", use:"anyframe.plugin.zsh", on:"junegunn/fzf-bin"
    zplug "gohugoio/hugo", as:command, from:gh-r, rename-to:hugo, use:"*Linux*.tar.gz"
    zplug "direnv/direnv", as:command, from:gh-r, rename-to:direnv
    ;;
esac

export ZSH_INIT_DIR=$HOME/.zsh/inits
zplug "uyorum/zsh-init-loader", defer:3

if ! zplug check; then
  zplug install
fi
zplug load

[[ -e ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local

run-tmux
