# Configuration for Firefox
Configuration memo for Firefox

## Add-on
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

