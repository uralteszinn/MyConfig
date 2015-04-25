#!/bin/bash

. /etc/X11/xinit/xinitrc.d/* # For blueman nautilus support

setxkbmap -layout us\(colemak\),ch,us,us\(dvp\) -option grp:sclk_toggle
xsetroot -cursor_name left_ptr
xset r 66

#xmodmap -e "keycode 105 = Cyrillic_sha"
xmodmap -e "keycode 65 = space space space space Cyrillic_sha"
xmodmap -e "keycode 94 = Escape Escape Escape Escape Cyrillic_schwa" # For awesome this command doesn't work, it's integrated in the awesome config
xmodmap -e "keycode 112 = Prior XF86ScrollUp"
xmodmap -e "keycode 117 = Next XF86ScrollDown"

#xcompmgr

exec awesome
#exec fluxbox
#exec openbox
#exec blackbox
