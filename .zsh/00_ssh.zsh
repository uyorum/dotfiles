if [ -f ~/bin/address ]; then
  address=`cat ~/bin/address`
  if [ ! -f ~/.ssh/config.work ]; then
    cat <<EOF > ~/.ssh/config.work
Host work
  HostName ADDRESS
  User uyorum
EOF
  fi
  sed -i "s/HostName.*$/HostName $address/g" ~/.ssh/config.work
  echo "SSH to $address"
  echo -n "Connect to this host?: (Y/n) "
  read
  if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
    ssh -F ~/.ssh/config.work work
    exit
  fi
fi
