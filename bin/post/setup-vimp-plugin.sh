#!/bin/zsh

echo "Installing vimperator plugins..."

if [[ `uname` =~ CYGWIN ]]; then
  vimp_dir="$HOME/vimperator"
else
  vimp_dir="$HOME/.vimperator"
fi

echo "Using ${vimp_dir} as vimperator directory"

# use vimperator-plugins reposity
mkdir -p ${vimp_dir}/plugin
cd ${vimp_dir}
if [ -d "${vimp_dir}/vimperator-plugins/.git" ]; then
  echo "vimperator-plugins seems to be already cloned"
  echo "Updating it..."
  (cd vimperator-plugins; git pull)
else
  git clone https://github.com/vimpr/vimperator-plugins
fi

# In Windows, symbolic link does not work
cp -f vimperator-plugins/plugin_loader.js plugin/
cat <<EOF > vimperator-plugins/.git/hooks/post-merge
#!/bin/bash

cp ${vimp_dir}/vimperator-plugins/plugin_loader.js ${vimp_dir}/plugin
EOF
