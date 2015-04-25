trayWibox = wibox({})

trayWibox.height = 27
trayWibox.width = 100
trayWibox.visible = true

wiboxPositioning(trayWibox, 1, 0, 0, "left", "top", "w")
trayWibox.x = trayWibox.x
trayWibox.y = trayWibox.y  + 327

local layout = wibox.layout.margin()
layout:set_margins(6)
layout:set_widget(tray)

trayWibox:set_widget(layout)

