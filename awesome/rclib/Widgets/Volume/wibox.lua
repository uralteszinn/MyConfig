volWibox = {}

for s=1, screen.count() do
  volWibox[s]              = wibox({})
  volWibox[s].width        = volWidth
  volWibox[s].height       = volHeight
  volWibox[s].visible      = true

  wiboxPositioning(volWibox[s], s, 0, 100, "left", "bottom")
  volWibox[s].y = volWibox[s].y - 90

  volWibox[s]:set_widget(volWidget)
end
