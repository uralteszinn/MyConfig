internetWibox = {}

for s = 1, screen.count() do
  internetWibox[s] = wibox({})
  internetWibox[s].height = internetHeight
  internetWibox[s].width = internetWidth
  internetWibox[s].visible = true

  wiboxPositioning(internetWibox[s], s, 0, 100, "left", "bottom")
  internetWibox[s].y = internetWibox[s].y - 230 

  internetWibox[s]:set_widget(internetWidget)
end

