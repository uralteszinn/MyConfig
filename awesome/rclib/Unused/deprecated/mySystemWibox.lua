mySystemWibox = {}

for s = 1, screen.count() do
  systemIconSize = 100
  mySystemWibox[s]              = wibox({})
  mySystemWibox[s]:set_bg(beautiful.systemWiboxBG)
  mySystemWibox[s]:set_fg(beautiful.systemWiboxFG)
  mySystemWibox[s].height       = 4*systemIconSize
  mySystemWibox[s].width        = systemIconSize
  mySystemWibox[s].visible      = false
  mySystemWibox[s].ontop        = true
  mySystemWibox[s].border_width = beautiful.systemWiboxBorderWidth
  mySystemWibox[s].border_color = beautiful.systemWiboxBorderColor

  mySystemWibox[s].x = screen[s].geometry.x + 7
  mySystemWibox[s].y = screen[s].geometry.y - 40 +  screen[s].geometry.height - (mySystemWibox[s].height + 2*mySystemWibox[s].border_width)
  --awful.placement.centered(mySystemWibox[s])
  --mySystemWibox[s].x = mySystemWibox[s].x - mySystemWibox[s].border_width
  --mySystemWibox[s].y = mySystemWibox[s].y - mySystemWibox[s].border_width
  mySystemWibox[s]:connect_signal("mouse::enter", function()
    if mySystemWibox[s].visible then
      systemTimer:stop()
    end
  end)
  mySystemWibox[s]:connect_signal("mouse::leave", function()
    if mySystemWibox[s].visible then
      systemTimer:start()
    end
  end)


  if s==1 then
    dofile(wgt_path .. "system.lua")
  end 

  mySystemLayout_left = wibox.layout.fixed.vertical()
  for _, system in ipairs(mySystem[s]) do
    mySystemLayout_left:add(system)
  end

  mySystemLayout = wibox.layout.align.horizontal()
  mySystemLayout:set_left(mySystemLayout_left)
  
  mySystemWibox[s]:set_widget(mySystemLayout)
end

systemTimer = timer({timeout = 1})
systemTimer:connect_signal("timeout", function() 
  for s=1, screen.count() do
    mySystemWibox[s].visible = false
  end
  systemTimer:stop()
end)


showSystemWibox = function()
  mySystemWibox[mouse.screen].visible = true
  if systemTimer.started then
    systemTimer:stop()
  end
  systemTimer:start()
end

