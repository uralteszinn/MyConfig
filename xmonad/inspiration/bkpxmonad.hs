import qualified Data.Map as M

import XMonad
import XMonad.Config.Gnome
import XMonad.Config.Desktop
import XMonad.Actions.CycleWS
import Control.Monad (liftM2)

import qualified XMonad.StackSet as W -- to shift and float windows
import XMonad.Actions.CycleWS

import XMonad.Hooks.ManageDocks
import XMonad.Layout.MosaicAlt
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders
import XMonad.Layout.ShowWName
import XMonad.Layout.WindowNavigation
import System.Exit (exitWith, ExitCode(..) )
--import XMonad.Layout.LayoutHints (layoutHints)

-- import XMonad.Util.Run (spawnPipe)

main :: IO ()
main = xmonad gnomeConfig
  { manageHook  = myManageHook 
  , borderWidth = 1
  , modMask     = mod1Mask
  , keys        = \c -> myKeys c `M.union` keys gnomeConfig c
  , layoutHook  = myLayout
  , workspaces  = myWorkspaces
  }
  where
    myLayout = avoidStruts $ showWName $ smartBorders $ 
        (navigable $ MosaicAlt M.empty) ||| 
        simpleTabbed

    navigable = configurableNavigation noNavigateBorders 

myManageHook :: ManageHook
myManageHook = composeAll (
    [ manageHook gnomeConfig
    , className =? "Tint2" --> doIgnore
    , className =? "Unity-2d-launcher" --> doFloat
    , className =? "Pidgin" -->  doShiftAndGo ">>  1  <<"

    , className =? "Firefox" --> doShift ">>  2  <<"
    , className =? "dwb" -->     doShiftAndGo ">>  2  <<"

    , className =? "URxvt" -->   doShiftAndGo ">>  3  <<"

    , className =? "Apvlv" -->   doShiftAndGo ">>  4  <<"
    , className =? "Zathura" --> doShiftAndGo ">>  4  <<"
    , className =? "Evince" -->  doShiftAndGo ">>  4  <<"
    ]
  )
    where
    doShiftAndGo ws = doF (W.greedyView ws) <+> doShift ws

myWorkspaces :: [String]
myWorkspaces = map (\i -> ">>  "++show i++"  <<") [1..9]

myKeys :: XConfig t -> M.Map (KeyMask, KeySym) (X ())
myKeys (XConfig {modMask = modm}) = M.fromList $
    [ ((modm, xK_v), spawn "dmenu_run -l 4 -nb black -nf yellow -sf yellow")
    -- , ((modm .|. shiftMask, xK_q), spawn "")
    , ((modm, xK_a), withFocused (sendMessage . expandWindowAlt))
    , ((modm, xK_z), withFocused (sendMessage . shrinkWindowAlt))
    , ((modm, xK_s), withFocused (sendMessage . tallWindowAlt))
    , ((modm, xK_d), withFocused (sendMessage . wideWindowAlt))

      -- close focused window
    , ((modm, xK_c), kill)

     -- reset the current layout
    , ((modm .|. controlMask,   xK_space ), sendMessage resetAlt)

      -- move focus to the next window
    , ((mod1Mask,               xK_Tab   ), windows W.focusDown)
      -- move focus to the previous window
    , ((mod1Mask .|. shiftMask, xK_Tab   ), windows W.focusUp)

    -- Navigate windows
    , ((modm,                 xK_l), sendMessage $ Go R)
    , ((modm,                 xK_g ), sendMessage $ Go L)
    , ((modm,                 xK_k   ), sendMessage $ Go U)
    , ((modm,                 xK_j ), sendMessage $ Go D)

      -- switching between workspaces
    , ((modm, xK_Right), nextWS)
    , ((modm, xK_Left ), prevWS)

      -- moving windows between adjacent workspaces
    , ((modm .|. shiftMask,   xK_Right), shiftToNext >> nextWS)
    , ((modm .|. shiftMask,   xK_Left ), shiftToPrev >> prevWS)

      -- swapping screens
    , ((modm,                 xK_x    ), swapNextScreen)

      -- shortcuts for often used software
    , ((modm,                  xK_Return), spawn "urxvt")
    , ((modm,                  xK_b), spawn "dwb")

      -- jump to workspaces
    , ((modm,                  xK_d), toggleOrView ">>  1  <<")
    , ((modm,                  xK_h), toggleOrView ">>  2  <<")
    , ((modm,                  xK_t), toggleOrView ">>  3  <<")
    , ((modm,                  xK_n), toggleOrView ">>  4  <<")
    , ((modm,                  xK_s), toggleOrView ">>  5  <<")

      -- sound management
    , ((0, 0x1008ff13), spawn "amixer -c 0 set Master playback 5%+")
    , ((0, 0x1008ff11), spawn "amixer -c 0 set Master playback 5%-")
    , ((0, 0x1008ff12), spawn "amixer -c 0 set Master playback toggle")

      -- session management
    , ((modm .|. shiftMask,    xK_q), io $ exitWith ExitSuccess )
    , ((0,    0xff13), io $ spawn "sudo /usr/bin/standby" )
    ]
