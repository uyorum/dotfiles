# Use $HOME/workspace as a working directory
export WORKSPACE=$HOME/workspace
test -d $WORKSPACE || (mkdir -p $WORKSPACE && echo "Created $WORKSPACE as workspace")
mkwork() {
  local workdir=$WORKSPACE/`date +%Y%m%d`_$1
  mkdir -p $workdir && cd $workdir
}
