## load configuration files
for f in ~/.zsh/[0-9][0-9]_*.(zsh|sh); do
  source "$f"
done
for f in ~/.zsh/`echo $OS`_*.(zsh|sh); do
  source "$f"
done

# Plugins
export ADOTDIR=~/.zsh/antigen
source ${ADOTDIR}/antigen/antigen.zsh
antigen bundles <<EOF
  unixorn/autoupdate-antigen.zshplugin
  zsh-users/zsh-syntax-highlighting
  chrissicool/zsh-256color
  rimraf/k
  zsh-users/zaw
EOF

# Run tmux
run-tmux
