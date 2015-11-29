if [ -d "/cygdrive/c/Program Files (x86)/VMware/VMware VIX" ]; then
  CMD_DIR="/cygdrive/c/Program Files (x86)/VMware/VMware VIX"
  CMD_VMRUN="vmrun.exe"
  list-vmx() {
    find "$USERPROFILE\Documents\Virtual Machines" -type f -name '*.vmx' | tr '/' '\\'
  }
  
  vmstart() {
    $CMD_DIR/$CMD_VMRUN -T player start `list-vmx | peco` nogui
  }
  
  vmsuspend() {
    $CMD_DIR/$CMD_VMRUN -T player suspend `list-vmx | peco`
  }
  
  vmlist() {
    $CMD_DIR/$CMD_VMRUN -T player list `list-vmx | peco`
  }
fi
