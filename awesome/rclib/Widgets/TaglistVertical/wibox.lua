taglistVerticalWibox = {}

for s = 1, screen.count() do
  taglistVerticalWibox[s] = wibox({})
  taglistVerticalWibox[s].height = 323
  taglistVerticalWibox[s].width = 100
  taglistVerticalWibox[s].visible = true
  taglistVerticalWibox[s]:set_bg("#333333")

  wiboxPositioning(taglistVerticalWibox[s], s, 0, 0, "left", "top", "w")
  taglistVerticalWibox[s]:struts({left = taglistVerticalWibox[s].x - screen[s].geometry.x + taglistVerticalWibox[s].width + 2*taglistVerticalWibox[s].border_width })

  local layout = wibox.layout.margin()
  layout:set_margins(4)
  layout:set_widget(taglistVertical[s])

  taglistVerticalWibox[s]:set_widget(layout)
end

