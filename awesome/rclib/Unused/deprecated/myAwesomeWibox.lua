myAwesomeIcon = {}
myAwesome = {}
myAwesomeWibox = {}

for s=1, screen.count() do
  myAwesomeIcon[s] = wibox.widget.imagebox()
  myAwesomeIcon[s]:set_image(ico_path .. "awesomeGray.png")
  myAwesome[s] = wibox.widget.background()
  myAwesome[s]:set_widget(myAwesomeIcon[s])
  myAwesome[s]:connect_signal("mouse::enter", function() myAwesomeIcon[s]:set_image(ico_path .. "awesome.png") end)
  myAwesome[s]:connect_signal("mouse::leave", function() myAwesomeIcon[s]:set_image(ico_path .. "awesomeGray.png") end)

  myAwesomeWibox[s] = wibox({})
  myAwesomeWibox[s].width = 33
  myAwesomeWibox[s].height = 33
  myAwesomeWibox[s].visible = true

  myAwesomeWibox[s].x = screen[s].geometry.x + screen[s].geometry.width - (myAwesomeWibox[s].width + 2*myAwesomeWibox[s].border_width)
  myAwesomeWibox[s].y = screen[s].geometry.y + screen[s].geometry.height - (myAwesomeWibox[s].height + 2*myAwesomeWibox[s].border_width)

  myAwesomeWibox[s]:set_widget(myAwesome[s])
end
