#!/bin/zsh

echo "Installing/Upgrading zplug..."

export ZPLUG_HOME=${HOME}/.zplug
if [[ ! -d ${ZPLUG_HOME} ]]; then
  git clone https://github.com/zplug/zplug ${ZPLUG_HOME}
else
  cd ${ZPLUG_HOME}
  git pull
fi
