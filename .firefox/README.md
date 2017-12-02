# Configuration for Firefox
Configuration memo for Firefox

## Add-ons
* [Vimium-FF](https://addons.mozilla.org/ja/firefox/addon/vimium-ff/)
* [Tree-style tab](https://addons.mozilla.org/ja/firefox/addon/tree-style-tab/)
* [GhostText](https://addons.mozilla.org/ja/firefox/addon/ghosttext/)
* [Shortkeys](https://addons.mozilla.org/ja/firefox/addon/shortkeys-custom-shortcuts/)

### Vimium

```
unmap m
unmap `
unmap p
unmap P

# scroll
map <c-b> scrollFullPageUp
map <c-f> scrollFullPageDown

# tab
map <c-n> nextTab
map <c-p> previousTab
unmap J
map J nextTab
unmap K
map K previousTab
map d removeTab
map u restoreTab
map @ togglePinTab
unmap O
unmap T
map O Vomnibar.activateEditUrl
map T Vomnibar.activateEditUrlInNewTab
map ;t LinkHints.activateModeToOpenInNewForegroundTab

# quick marks
map gna createTab https://www.amazon.co.jp/
map gnb createTab https://www.sbisec.co.jp/ETGate
map gnB createTab http://bookmeter.com/
map gnc createTab https://calendar.google.com/
map gnC createTab https://travis-ci.org/
map gnd createTab https://hub.docker.com/
map gne createTab https://www.evernote.com/Home.action
map gng createTab https://github.com/uyorum
map gni createTab https://inbox.google.com/
map gnI createTab https://ifttt.com/
map gnk createTab https://kindle.amazon.co.jp/
map gno createTab https://my.orico.co.jp/eorico/referenceMenu.do
map gnO createTab https://point.orico.co.jp/id/script/menu/gototop
map gnp createTab https://getpocket.com/
map gnP createTab https://photos.google.com/
map gns createTab https://slack.com/
map gnS createTab https://docs.google.com/spreadsheets/
map gnt createTab https://www.toodledo.com/
map gnT createTab https://trello.com/
map gnu createTab https://entry11.bk.mufg.jp/ibg/dfw/APLIN/loginib/login?_TRANID=AA000_001
```

### Shortkeys

|Keyboard Shortcut|Behavior|Javascript code|
|:--|:--|:--|
|`c m`|Run JavaScript|`prompt('Copy to Clipboard', '[' + document.title.replace(/([\[\]])/g,'\\$1') + ']' + '(' + location.href + ')')`|
|`c p`|Run JavaScript|`prompt('Copy to Clipboard', document.title + ' ' + location.href)`|

## userChrome.css

``` bash
$ cd PROFILE_DIR
$ mkdir -p chrome
$ cat <<EOF >>chrome/userChrome.css
.tabbrowser-tab[fadein]:not([pinned]) {
    display: none !important;
}
.tabs-newtab-button {
    display:none !important;
}
#sidebar-header { display: none; }
EOF
```

