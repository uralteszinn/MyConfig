Config { font = "xft:Bitstream Vera Sans Mono-11"
--Config { font = "xft:Monte Carlo-11"
--Config { font = "xft:Times New Roman-11"
       , bgColor = "black"
       , fgColor = "#888888"
       , position = Top
       , borderColor = "green"
       , lowerOnStart = False
       , border = NoBorder
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %StdinReader%}%bat%{<fc=black,#333333> </fc> %date% "
       , commands = 
           [ Run StdinReader 
           , Run Com "xmobarBattery" [] "bat" 10
           , Run Date "<fc=orange>TIME %H:%M:%S</fc>" "date" 5 
           ]
       }
