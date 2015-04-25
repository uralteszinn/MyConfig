wlanWibox = {}

for s = 1, screen.count() do
  wlanWibox[s] = wibox({})
  wlanWibox[s].height = wlanHeight
  wlanWibox[s].width = wlanWidth
  wlanWibox[s].visible = true

  wiboxPositioning(wlanWibox[s], s, 0, 100, "left", "bottom")
  wlanWibox[s].y = wlanWibox[s].y - 160

  wlanWibox[s]:set_widget(wlanWidget)
end

