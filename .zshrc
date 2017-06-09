# zplug
export ZPLUG_HOME=$HOME/.zplug
if [[ ! -d ${ZPLUG_HOME} ]]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
source ${ZPLUG_HOME}/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "rimraf/k"
zplug "zsh-users/zaw"
zplug "b4b4r07/enhancd", use:init.sh
zplug "motemen/ghq", as:command, from:gh-r, rename-to:ghq
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
#zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
zplug "peco/peco", as:command, from:gh-r, rename-to:peco
zplug "b4b4r07/zsh-gomi", as:command, use:bin/gomi, on:junegunn/fzf-bin
zplug "Songmu/make2help", as:command, from:gh-r, rename-to:make2help
case $(uname) in
  Linux*)
    zplug "spf13/hugo", as:command, from:gh-r, rename-to:hugo, use:"*Linux*"
    ;;
  Darwin*)
    zplug "spf13/hugo", as:command, from:gh-r, rename-to:hugo, use:"*macOS*"
    ;;
esac
if in-path -q go; then
  # zplug can't install pre-build binary without tar or zip
  zplug "direnv/direnv", as:command, hook-build:"go get -d && go build"
fi

# init-loader numbering
# 00    00_ssh.zsh
# 01-30 my configurations
# 31-60 plugins
# 80    80_aliases.zsh
export ZSH_INIT_DIR=$HOME/.zsh/inits
zplug "uyorum/zsh-init-loader", defer:3
zplug "${HOME}/.zshrc.local", from:local, defer:3, if:"[[ -e ${HOME}/.zshrc.local ]]"

if ! zplug check; then
  zplug install
fi
zplug load

run-tmux
