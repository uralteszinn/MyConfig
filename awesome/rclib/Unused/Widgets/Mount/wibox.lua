mountWibox = {}

for s = 1, screen.count() do
  mountWibox[s] = wibox({})
  mountWibox[s].height = 30 + #mountInfo * 18
  mountWibox[s].width = 250
  mountWibox[s].visible = true

  wiboxPositioning(mountWibox[s], s, 35, 50, "right", "center")

  local layout = wibox.layout.fixed.vertical()

  local marginLayout = wibox.layout.margin()
  marginLayout:set_left(8)
  marginLayout:set_bottom(12)
  marginLayout:set_widget(mountTextboxes.background)
  layout:add(marginLayout)

  for i = 1, #mountTextboxes do
    local marginLayout = wibox.layout.margin()
    marginLayout:set_left(8)
    marginLayout:set_widget(mountTextboxes[i].background)
    layout:add(marginLayout)
  end

  mountWibox[s]:set_widget(layout)
end
