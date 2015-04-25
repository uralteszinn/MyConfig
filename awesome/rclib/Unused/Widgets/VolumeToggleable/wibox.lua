volPBWibox = {}
volTextboxWibox = {}

for s=1, screen.count() do
  volPBWibox[s]              = wibox({})
  volPBWibox[s].border_width = volBorderWidth
  volPBWibox[s].width        = volWidth
  volPBWibox[s].height       = volPBHeight
  volPBWibox[s].visible      = true

  wiboxPositioning(volPBWibox[s], s, 50, 50)

  volPBWibox[s]:set_widget(volPB)

  volTextboxWibox[s]              = wibox({})
  volTextboxWibox[s].border_width = volBorderWidth
  volTextboxWibox[s].width        = volWidth
  volTextboxWibox[s].height       = volHeight - volPBHeight

  wiboxPositioning(volTextboxWibox[s], s, 50, 50, "center", "bottom")
  volTextboxWibox[s].y = volTextboxWibox[s].y - volPBWibox[s].height/2

  volTextboxWibox[s]:set_widget(volTextbox)
end
