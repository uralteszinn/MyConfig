clockWibox = {}

for s=1, screen.count() do
  clockWibox[s]         = wibox({})
  clockWibox[s].width   = clockWidth
  clockWibox[s].height  = clockHeight
  clockWibox[s].visible = true
  clockWibox[s]:set_bg("#ff0000")

  wiboxPositioning(clockWibox[s], s, 0, 100, "left", "bottom", "g")
  clockWibox[s].y = clockWibox[s].y 

  clockWibox[s]:set_widget(clockWidget)
end
