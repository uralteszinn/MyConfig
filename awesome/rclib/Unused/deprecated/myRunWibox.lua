myRunWibox = {}

for s = 1, screen.count() do
  myRunWibox[s]              = wibox({ screen = s })
  myRunWibox[s]:set_bg(beautiful.runWiboxBG)
  myRunWibox[s]:set_fg(beautiful.runWiboxFG)
  myRunWibox[s].width        = math.floor(screen[s].geometry.width/2)
  myRunWibox[s].height       = 25
  myRunWibox[s].visible      = false
  myRunWibox[s].ontop        = true
  myRunWibox[s].border_width = beautiful.runWiboxBorderWidth
  myRunWibox[s].border_color = beautiful.runWiboxBorderColor

  myRunWibox[s].x = screen[s].geometry.x
  myRunWibox[s].y = screen[s].geometry.y
  awful.placement.centered(myRunWibox[s])
  myRunWibox[s].x = myRunWibox[s].x - myRunWibox[s].border_width
  myRunWibox[s].y = myRunWibox[s].y - myRunWibox[s].border_width
  
  if s==1 then
    dofile(wgt_path .. "run.lua")
  end 

  myRunWibox[s]:set_widget(myRunBox[s])
end
