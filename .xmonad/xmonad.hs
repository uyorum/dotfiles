import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import Graphics.X11.ExtraTypes.XF86
main = do
  spawn "trayer --edge top --align right --SetDockType true --SetPartialStrut false --expand true --widthtype percent --width 20 --transparent true --alpha 0 --tint 0x000000 --heighttype pixel --height 19"
  spawn "syndaemon -d -t -i 0.5 -K"
  spawn "nm-applet"
  spawn "blueman-applet"
  spawn "dropbox start"
  spawn "skype"
  spawn "volumeicon"
  spawn "xscreensaver -no-splash"
  spawn "xmodmap ~/.Xmodmap"
  spawn "/usr/bin/perl ~/bin/watchxss.pl"
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobarrc"
  xmonad $ defaultConfig {
      manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    , logHook = dynamicLogWithPP $ xmobarPP
                    { ppOutput = hPutStrLn xmproc
                    , ppTitle = xmobarColor "green" "" . shorten 50
                    }
    , terminal           = "urxvt"
    , borderWidth        = 2
    , normalBorderColor  = "#333333"
    , focusedBorderColor = "#cd8b00"
    , modMask = mod4Mask
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_l), spawn "xscreensaver-command -lock")
    , ((mod4Mask, xK_q), spawn "killall trayer; killall volumeicon; killall nm-applet; xmonad --recompile; xmonad --restart")
    , ((0, 0x1008FF11), spawn "amixer set Master 2-")
    , ((0, 0x1008FF13), spawn "amixer set Master 2+")
    , ((0, 0x1008FF12), spawn "amixer set Master toggle")
    ]
