batWibox         = wibox({})
batWibox.width   = batWiboxWidth
batWibox.height  = batWiboxHeight
batWibox.visible = true

wiboxPositioning(batWibox, 1, 0, 0, "left", "top")
batWibox.y = batWibox.y + 358

batLayout = wibox.layout.fixed.vertical()
batLayoutWithMargin = wibox.layout.margin()
batLayoutWithMargin:set_margins(8)
batLayoutWithMargin:set_widget(batLayout)

batWibox:set_widget(batLayoutWithMargin)
