batPBWibox         = wibox({})
batPBWibox.width   = batPBWidth
batPBWibox.height  = screen[1].workarea.height 
batPBWibox.visible = true

wiboxPositioning(batPBWibox, 1, 100, 0, "right", "top", "w")

batPBWibox:struts({ right = batPBWibox.width })

batPBWibox:set_widget(batPB)

batPBWibox:connect_signal("mouse::enter", function() batWibox.ontop = true end)
batPBWibox:connect_signal("mouse::leave", function() batWibox.ontop = false end)

batWibox         = wibox({})
batWibox.width   = 250
batWibox.height  = 90
batWibox.visible = true

wiboxPositioning(batWibox, 1, 70, 90, "left", "bottom")

local layout = wibox.layout.margin()
layout:set_margins(8)
layout:set_widget(batWidget)

batWibox:set_widget(layout)
