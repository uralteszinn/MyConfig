import XMonad

import qualified Data.Map as M
import qualified XMonad.StackSet as W 

import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Loggers 
import XMonad.Util.Run (spawnPipe,hPutStrLn)
import XMonad.Hooks.ManageDocks (avoidStruts)
import XMonad.Layout.MosaicAlt
import XMonad.Layout.Tabbed
import System.Exit (exitWith, ExitCode(..) )

main = do 
  spawn "feh --bg-fill /home/laurin/.lib/wallpapers/dark-sun.jpg"
  h <- spawnPipe "xmobar /home/laurin/.xmonad/xmobarrc.hs"
  spawn "xmobar /home/laurin/.xmonad/xmobarrc2.hs"
  xmonad (myConfig h)
    where myConfig h = defaultConfig 
            { terminal           = myTerminal
            , modMask            = mod1Mask
            , borderWidth        = 1
            , workspaces         = myWorkSpaces
            , keys               = myKeys
            , manageHook         = myManageHook
            , logHook            = myLogHook h
            , layoutHook         = myLayout
            , normalBorderColor  = "#000000"
            , focusedBorderColor = "#111111"
            } 

myTerminal   = "urxvtc"
myBrowser    = "dwb"
myPDFViewer  = "evince"
myRunCommand = "dmenu_run -b -p 'Run:' -nb black -nf orange -sb forestgreen -sf black"
myWorkSpaces = ["Web", "Term", "Vim", "PDF"]

myLayout = avoidStruts $ tiled ||| Mirror tiled ||| Full ||| simpleTabbed ||| MosaicAlt M.empty
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100
  

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys (XConfig {modMask = m}) = M.fromList $ 
     [ ((m .|. shiftMask    , xK_q        ), io (exitWith ExitSuccess)                                     )
     , ((m                  , xK_q        ), spawn $ "if type xmonad; " ++
                                                     "then xmonad --recompile && xmonad --restart; " ++
                                                     "else xmessage xmonad not in \\$PATH: \"$PATH\"; " ++
                                                     "fi"                                                  )
     , ((m                  , xK_Return   ), spawn myTerminal                                              )
     , ((m                  , xK_b        ), spawn myBrowser                                               )
     , ((m                  , xK_r        ), spawn myRunCommand                                            )
     , ((m .|. shiftMask    , xK_Return   ), kill                                                          )
     , ((m                  , xK_Tab      ), windows W.focusDown                                           )
     , ((m .|. shiftMask    , xK_Tab      ), windows W.focusUp                                             )
     , ((m                  , xK_space    ), sendMessage NextLayout                                        )
     , ((m                  , xK_n        ), windows $ W.greedyView (myWorkSpaces !! 0)                    )
     , ((m                  , xK_e        ), windows $ W.greedyView (myWorkSpaces !! 1)                    )
     , ((m                  , xK_i        ), windows $ W.greedyView (myWorkSpaces !! 2)                    )
     , ((m                  , xK_o        ), windows $ W.greedyView (myWorkSpaces !! 3)                    )
     , ((0                  , 0x1008ff2f  ), spawn "sudo pm-suspend"                                       )
     , ((0                  , 0x1008ff2a  ), spawn "session_dialog"                                        )
     , ((0                  , 0x1008ff11  ), spawn "amixer -c 0 set Master playback 5%-"                   )
     , ((0                  , 0x1008ff12  ), spawn "amixer -c 0 set Master playback toggle"                )
     , ((0                  , 0x1008ff13  ), spawn "amixer -c 0 set Master playback 5%+"                   )
     ]

myManageHook :: ManageHook
myManageHook = composeAll
     [ className  =? "URxvt"            --> doShiftAndGo (myWorkSpaces !! 1)
     , className  =? "Firefox"          --> doShift      (myWorkSpaces !! 0)
     , className  =? "Dwb"              --> doShift      (myWorkSpaces !! 0)
     , className  =? "Gvim"             --> doShift      (myWorkSpaces !! 2)
     , className  =? "Evince"           --> doShift      (myWorkSpaces !! 3)
     , className  =? "Zathura"          --> doShift      (myWorkSpaces !! 3)
     , className  =? "Gimp"             --> doFloat
     , className  =? "Gxmessage"        --> doCenterFloat
     , className  =? "Xmessage"         --> doCenterFloat
     , className  =? "Xdialog"          --> doCenterFloat
     , className  =? "Stopwatch"        --> doCenterFloat
     , className  =? "stalonetray"      --> doIgnore
     , className  =? "Xfce4-notifyd"    --> doIgnore
     ] where
         doShiftAndGo ws = doF (W.greedyView ws) <+> doShift ws
          
myLogHook h = dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn h 
                                           , ppCurrent = xmobarColorFg "orange" 
                                           , ppHidden = xmobarColorFg "forestgreen" 
                                           , ppHiddenNoWindows = id
                                           , ppUrgent = xmobarColor "white" "red"
                                           , ppSep = " <fc=black,#333333> </fc> "
                                           , ppTitle = const ""
                                           , ppExtras = []
                                           } 

xmobarColorFg :: String -> String -> String
xmobarColorFg fg out = "<fc=" ++ fg ++ ">" ++ out ++ "</fc>"
