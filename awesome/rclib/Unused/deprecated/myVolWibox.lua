showVolPB = function()
  if volPBTimer.started then
    volPBTimer:stop()
  end
  volPBTimer:start()
  myVolWibox[mouse.screen].ontop = true
end

removeVolPB = function()
  volPBTimer:stop()
  for s=1,screen.count() do
    myVolWibox[s].ontop = false
  end
end

volPBTimer = timer({timeout = beautiful.volPBTimeout})
volPBTimer:connect_signal("timeout", removeVolPB)

myVolWibox = {}
for s=1, screen.count() do
  myVolWibox[s]         = wibox({})
  myVolWibox[s].width   = 200
  myVolWibox[s].height  = 25
  myVolWibox[s].visible = true

  myVolWibox[s].x       = screen[s].geometry.x
  myVolWibox[s].y       = screen[s].geometry.y
  awful.placement.centered(myVolWibox[s])
  --myVolWibox[s].x = myVolWibox[s].x - myVolWibox[s].border_width
  --myVolWibox[s].y = screen[s].geometry.y + math.floor(5/6*screen[s].geometry.height) - (myVolWibox[s].height + 2*myVolWibox[s].border_width)

  if s==1 then
    dofile(wgt_path .. "volumePB.lua")
  end

  myVolWibox[s]:set_widget(volPB)
end
