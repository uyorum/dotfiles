const {classes: Cc, interfaces: Ci, utils: Cu} = Components
const nsIStyleSheetService = Cc['@mozilla.org/content/style-sheet-service;1']
      .getService(Ci.nsIStyleSheetService)
const globalMessageManager = Cc['@mozilla.org/globalmessagemanager;1']
      .getService(Ci.nsIMessageListenerManager)
const {Preferences} = Cu.import('resource://gre/modules/Preferences.jsm', {})
const gClipboardHelper = Components.classes["@mozilla.org/widget/clipboardhelper;1"]
      .getService(Components.interfaces.nsIClipboardHelper);

const FIREFOX_PREFS = {
  "extensions.VimFx.config_file_directory": "~/.vimfx",
  "devtools.chrome.enabled": true,
  "browser.urlbar.filter.javascript": false,
  "findbar.modalHighlight": false,
  "findbar.highlightAll": false,
  "toolkit.scrollbox.horizontalScrollDistance": 5,
  "toolkit.scrollbox.verticalScrollDistance": 5,

  // It's All Text!
  "extensions.itsalltext.extensions": ".md",
  "extensions.itsalltext.fade_time": "5",
  "extensions.itsalltext.hotkey": "0:1:0:0:105:0", // Ctrl-I
  "extensions.itsalltext.refresh": 3,

  // BYM
  "bym.fxvlink": "#551A8B",
  "bym.bkg": "#002B36",
  "bym.link": "#2AA198",
  "bym.vlink": "#CB4B16",

}

const VIMFX_PREFS = {
  "hints.chars": "asdfghjkl;",
  "prev_patterns": "prev  previous  ‹  «  ◀  ←  <<  <  back  newer  前へ",
  "next_patterns": "next  ›  »  ▶  →  >>  >  more  older  次へ",
  "config_file_directory": "~/.vimfx",
}

const MAPPINGS = {
  "mode.normal.copy_current_url": "y",
  "mode.normal.scroll_page_down": "<space>  <c-f>",
  "mode.normal.scroll_page_up": "<s-space>  <c-b>",
  "mode.normal.scroll_half_page_down": "",
  "mode.normal.scroll_half_page_up": "",
  "mode.normal.scroll_to_left": "",
  "mode.normal.scroll_to_right": "",

  "mode.normal.tab_duplicate": "\\",
  "mode.normal.tab_select_previous": "K  <c-p>",
  "mode.normal.tab_select_next": "J  <c-n>",
  "mode.normal.tab_move_backward": "gK",
  "mode.normal.tab_move_forward": "gJ",
  "mode.normal.tab_toggle_pinned": "@",
  "mode.normal.tab_close": "d",
  "mode.normal.tab_restore": "u",
  "mode.normal.tab_restore_list": "DX",
  "mode.normal.tab_close_to_end": "Dx$",
  "mode.normal.tab_close_other": "Dxa",

  "mode.normal.follow_in_tab": "et",
  "mode.normal.follow_in_focused_tab": "F",
  "mode.normal.follow_multiple": ";F",
  "mode.normal.follow_copy": "",
  "mode.normal.follow_focus": "",

  "mode.normal.open_context_menu": "",

  "mode.normal.click_browser_element": "",

  "mode.normal.element_text_select": "",
  "mode.normal.element_text_copy": "",
}

// Quick marks
const QMARKS = {
  "a": "https://www.amazon.co.jp/",
  "b": "http://bookmeter.com/",
  "c": "https://calendar.google.com/",
  "C": "https://travis-ci.org/",
  "d": "https://hub.docker.com/",
  "e": "https://www.evernote.com/intl/jp",
  "g": "https://github.com/uyorum",
  "i": "https://inbox.google.com/",
  "I": "https://ifttt.com/",
  "j": "https://www.jaccs.co.jp/icmclub/icm_login.html",
  "J": "http://www.jaccsmall.com/",
  "k": "https://kindle.amazon.co.jp/",
  "p": "https://getpocket.com/",
  "P": "https://photos.google.com/",
  "s": "https://slack.com/",
  "S": "https://docs.google.com/spreadsheets/",
  "t": "https://www.toodledo.com/",
  "T": "https://trello.com/",
  "u": "https://entry11.bk.mufg.jp/ibg/dfw/APLIN/loginib/login?_TRANID=AA000_001",
}

// Load
Preferences.set(FIREFOX_PREFS)

Object.entries(VIMFX_PREFS).forEach(([command, value]) => {
  vimfx.set(command, value)
})

Object.entries(MAPPINGS).forEach(([command, value]) => {
  vimfx.set(command, value)
})

Object.entries(QMARKS).forEach(([key, url]) => {
  if (key.match(/^[A-Z]$/)) {
    var cmd_name_o = 'qmark_o_large_' + key.toLowerCase()
    var cmd_name_n = 'qmark_n_large_' + key.toLowerCase()
  } else {
    var cmd_name_o = 'qmark_o_' + key
    var cmd_name_n = 'qmark_n_' + key
  }
  let key_bind_o = 'go' + key
  let key_bind_n = 'gn' + key

  vimfx.addCommand({
    name: cmd_name_o,
    description: 'Open ' + url + ' in current tab'
  }, ({vim}) => {
    vim.window.gBrowser.loadURI(url)
  })
  vimfx.set('custom.mode.normal.' + cmd_name_o, key_bind_o)

  vimfx.addCommand({
    name: cmd_name_n,
    description: 'Open ' + url + ' in new tab'
  }, ({vim}) => {
    vim.window.gBrowser.loadOneTab(url)
  })
  vimfx.set('custom.mode.normal.' + cmd_name_n, key_bind_n)
})

// Functions
vimfx.addCommand({
  name: 'copy_plain',
  description: 'Copy Title URL to Clipboard'
}, ({vim}) => {
  let url = vim.window.gBrowser.selectedBrowser.currentURI.spec
  let title = vim.window.gBrowser.selectedBrowser.contentTitle
  let fmt = title + " " + url
  gClipboardHelper.copyString(fmt)
  vim.notify("Copied String: " + fmt)
})
vimfx.set('custom.mode.normal.copy_plain', 'cp')

vimfx.addCommand({
  name: 'copy_markdown',
  description: 'Copy [Title](URL) to Clipboard'
}, ({vim}) => {
  let url = vim.window.gBrowser.selectedBrowser.currentURI.spec
  let title = vim.window.gBrowser.selectedBrowser.contentTitle
  let fmt = "[" + title + "](" + url + ")"
  gClipboardHelper.copyString(fmt)
  vim.notify("Copied String: " + fmt)
})
vimfx.set('custom.mode.normal.copy_markdown', 'cm')

vimfx.addCommand({
  name: 'copy_selection',
  description: 'Copy the selection or current url',
  category: 'location'
}, ({vim}) => {
  vimfx.send(vim, 'getSelection', true, selection => {
    if (selection == '') {
      selection = vim.window.gBrowser.selectedBrowser.currentURI.spec
    }
    gClipboardHelper.copyString(selection)
    vim.notify("Copied String: " + selection)
  })
})
vimfx.set('custom.mode.normal.copy_selection', 'Y')

vimfx.addCommand({
  name: 'search_selected_text',
  description: 'Search for the selected text'
}, ({vim}) => {
  vimfx.send(vim, 'getSelection', true, selection => {
    if (selection != '') {
      vim.window.switchToTabHavingURI(`https://www.google.co.jp/search?q=${selection}`, true)
    }
  })
})
vimfx.set('custom.mode.normal.search_selected_text', 's')

vimfx.addCommand({
  name: 'zoom_in',
  description: 'enlarge text',
}, ({vim}) => {
  vim.window.FullZoom.enlarge();
})
vimfx.set('custom.mode.normal.zoom_in', '+')

vimfx.addCommand({
  name: 'zoom_out',
  description: 'reduce text',
}, ({vim}) => {
  vim.window.FullZoom.reduce();
})
vimfx.set('custom.mode.normal.zoom_out', '-')

vimfx.addCommand({
  name: 'reset_zoom',
  description: 'reset zoom',
}, ({vim}) => {
  vim.window.FullZoom.reset();
})
vimfx.set('custom.mode.normal.reset_zoom', '0')
