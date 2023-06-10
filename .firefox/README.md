# Configuration for Firefox
Configuration memo for Firefox

## Add-on
### Shortkeys

Import this code:

``` json
[
  {
    "key": "c m",
    "action": "javascript",
    "code": "prompt('Copy to Clipboard', '[' + document.title.replace(/([\\[\\]])/g,'\\\\$1') + ']' + '(' + location.href + ')')",
    "sites": "",
    "sitesArray": [
      ""
    ]
  },
  {
    "key": "c p",
    "action": "javascript",
    "code": "prompt('Copy to Clipboard', document.title + ' ' + location.href)",
    "sites": "",
    "sitesArray": [
      ""
    ]
  }
]
```

## userChrome.css

1. Access to `about:profile` and open profile directory.
1. Create `chrome/userChrome.css`

``` bash
$ mkdir -p chrome
$ cat <<EOF >>chrome/userChrome.css
#main-window[tabsintitlebar="true"]:not([extradragspace="true"]) #TabsToolbar>.toolbar-items {
    opacity: 0;
    pointer-events: none;
}

#main-window:not([tabsintitlebar="true"]) #TabsToolbar {
    visibility: collapse !important;
}

#sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
    display: none;
}

.tab {
    margin-left: 1px;
    margin-right: 1px;
}
EOF
```

1. Go to about:config and set this to `true`:

    * `toolkit.legacyUserProfileCustomizations.stylesheets`
