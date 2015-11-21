-- ~/.xmonad/xmobarrc.hs
Config { font = "xft:Sans-9:bold"
       , bgColor = "black"
       , fgColor = "grey"
       , position = TopW L 70
       , lowerOnStart = False
       , commands = [ Run Network "eth0" ["-L","0","-H","32","--normal","green","--high","red"] 10
                    , Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10
                    , Run Memory ["-t","Mem: <usedratio>%"] 10
                    , Run Swap [] 10
                    , Run Battery [] 600
                    , Run Com "lsb_release" ["-s","-d"] "" 36000
                    , Run Date "%Y %b %_d(%a) %H:%M:%S" "date" 10
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "<fc=#ee9a00>%lsb_release%</fc> | %cpu% | %memory% %swap% | %eth0% | %battery% }{ %date%"
       }
