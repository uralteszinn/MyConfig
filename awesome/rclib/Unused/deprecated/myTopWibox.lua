myTopWibox = {}

for s = 1, screen.count() do
  myTopWibox[s]         = awful.wibox({ position = "top", screen = s })
  myTopWibox[s]:set_bg(beautiful.topWiboxBG)
  myTopWibox[s]:set_fg(beautiful.topWiboxFG)
  myTopWibox[s]:geometry({height = beautiful.topWiboxHeight})
  
  if s==1 then
    dofile(wgt_path .. "textclock.lua")
    dofile(wgt_path .. "tray.lua")
    dofile(wgt_path .. "layoutbox.lua")
    dofile(wgt_path .. "taglist.lua")
    dofile(wgt_path .. "separator.lua")
    dofile(wgt_path .. "spacer.lua")
    dofile(wgt_path .. "kl_switch.lua")
    dofile(wgt_path .. "wlan.lua")
    dofile(wgt_path .. "internet.lua")
    dofile(wgt_path .. "volume.lua")
    dofile(wgt_path .. "birthday.lua")
    --dofile(wgt_path .. "treeFileMenu.lua")
  end
 
  local myTopLayout_left = wibox.layout.fixed.horizontal()
  myTopLayout_left:add(space)
  myTopLayout_left:add(mytaglist[s])
  myTopLayout_left:add(space)
  myTopLayout_left:add(sep)
  myTopLayout_left:add(klSwitch)
  myTopLayout_left:add(sep)
  myTopLayout_left:add(wlanWidget)
  myTopLayout_left:add(sep)
  myTopLayout_left:add(internetWidget)
  myTopLayout_left:add(sep)
  myTopLayout_left:add(volWidget)
  myTopLayout_left:add(sep)
  myTopLayout_left:add(space)
  myTopLayout_left:add(birthdayImage)
  myTopLayout_left:add(birthdayWidgetText)
  myTopLayout_left:add(sep)

  local myTopLayout_right = wibox.layout.fixed.horizontal()
  if s==1 then
    myTopLayout_right:add(mysystray)
    myTopLayout_right:add(space)
  end
  myTopLayout_right:add(sep)
  myTopLayout_right:add(mytextclock)
  myTopLayout_right:add(mylayoutbox[s])

  local myTopLayout = wibox.layout.align.horizontal()
  myTopLayout:set_left(myTopLayout_left)
  myTopLayout:set_middle(nil)
  myTopLayout:set_right(myTopLayout_right)
  
  myTopWibox[s]:set_widget(myTopLayout)
end

