Config { font = "xft:Bitstream Vera Sans Mono-8"
--Config { font = "xft:Monte Carlo-8"
--Config { font = "xft:Times New Roman-8"
       , bgColor = "black"
       , fgColor = "#888888"
       , position = Bottom
       , borderColor = "green"
       , lowerOnStart = False
       , border = NoBorder
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %wlan0% <fc=black,#333333> </fc> %memory% <fc=black,#333333> </fc> %cpu% <fc=black,#333333> </fc>}%wlan%{<fc=black,#333333> </fc>%vol%<fc=black,#333333> </fc>%kbd%<fc=black,#333333> </fc> %date% "
       , commands = 
           [ Run Date "<fc=orange>DATE %d %B %Y</fc>" "date" 600
           , Run Com "xmobarWlan" [] "wlan" 10
           , Run Network "wlan0" ["-t", "TRAFFIC UP <tx> DOWN <rx>"
                                 , "-L", "20", "-H", "50"
                                 , "-n", "yellow", "-h", "red", "-l", "green"
                                 ] 30
           , Run Memory [ "-t" , "MEM <usedratio>"
                        , "-H", "60", "-L" , "30"
                        , "-l", "green", "-n", "yellow", "-h", "red"
                        ] 50
           , Run Cpu ["-t", "CPU <total>"
                     ,"-L", "20", "-H", "50"
                     , "-l", "green", "-n", "yellow", "-h", "red"
                     ] 30
--           , Run Brightness ["-t", "BRIGHTNESS <percent>%"] 10
           , Run Kbd [("us(colemak)", " KL Colemak ")
                     ,("us", "<fc=black,red> KL US </fc>")
                     ,("ch", "<fc=black,red> KL CH </fc>")
                     ,("us(dvorak)", "<fc=black,red> KL Dvorak </fc>")
                     ,("us(dvp)", "<fc=black,red> KL DVP </fc>")
                     ]
           , Run Com "xmobarVolume" [] "vol" 10
           ]
       }
