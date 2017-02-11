vimfx.listen('getSelection', (willRemove, callback) => {
  let selection = content.getSelection();
  let s = selection.toString();
  if (willRemove) {
    selection.removeAllRanges();
  }
  callback(s);
});
