myLauncherWibox = {}

for s = 1, screen.count() do
  launchIconSize = math.min(150,math.floor(screen[s].geometry.width/(2*#(launchPrgs))))
  myLauncherWibox[s]              = wibox({})
  myLauncherWibox[s]:set_bg(beautiful.launcherWiboxBG)
  myLauncherWibox[s]:set_fg(beautiful.launcherWiboxFG)
  myLauncherWibox[s].width        = #(launchPrgs)*launchIconSize
  myLauncherWibox[s].height       = launchIconSize
  myLauncherWibox[s].visible      = true
  myLauncherWibox[s].border_width = beautiful.launcherWiboxBorderWidth
  myLauncherWibox[s].border_color = beautiful.launcherWiboxBorderColor

  myLauncherWibox[s].x = screen[s].geometry.x
  myLauncherWibox[s].y = screen[s].geometry.y
  awful.placement.centered(myLauncherWibox[s])
  myLauncherWibox[s].x = myLauncherWibox[s].x - myLauncherWibox[s].border_width
  myLauncherWibox[s].y = myLauncherWibox[s].y - myLauncherWibox[s].border_width

  if s==1 then
    dofile(wgt_path .. "launcher.lua")
  end 

  myLauncherLayout_left = wibox.layout.fixed.horizontal()
  for _, launcher in ipairs(myLauncher[s]) do
    myLauncherLayout_left:add(launcher)
  end

  myLauncherLayout = wibox.layout.align.horizontal()
  myLauncherLayout:set_left(myLauncherLayout_left)
  
  myLauncherWibox[s]:set_widget(myLauncherLayout)
end
