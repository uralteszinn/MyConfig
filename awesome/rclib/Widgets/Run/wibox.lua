runWibox = {}

for s = 1, screen.count() do
  runWibox[s]              = wibox({})
  runWibox[s].width        = math.floor(screen[s].geometry.width/2)
  runWibox[s].height       = 25
  runWibox[s].visible      = false
  runWibox[s].ontop        = true

  runWibox[s].border_width = runBorderWidth
  runWibox[s].border_color = runColor.border

  wiboxPositioning(runWibox[s], s, 50, 50)

  runWibox[s]:set_widget(runWidget)
end
