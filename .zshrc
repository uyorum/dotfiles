# antigen
export ADOTDIR=~/.zsh/antigen
source ${ADOTDIR}/antigen/antigen.zsh
antigen bundle unixorn/autoupdate-antigen.zshplugin

# init-loader
export ZSH_INIT_DIR=$HOME/.zsh/inits
antigen bundle uyorum/zsh-init-loader

# init-loader numbering
# 00    00_ssh.zsh
# 01-30 my configurations
# 31-60 antigen plugins
# 80    80_aliases.zsh

# Run tmux
run-tmux
