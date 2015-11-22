# Load common functions
for f in ~/.zsh/lib/*.(zsh|sh); do
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

# Load configuration files
for f in ~/.zsh/inits/[0-9][0-9]_*.(zsh|sh); do
  source "$f"
done
for f in ~/.zsh/inits/`echo $OS`_*.(zsh|sh); do
  source "$f"
done

# Run tmux
run-tmux
