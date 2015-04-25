taglistWibox = {}

for s = 1, screen.count() do
  taglistWibox[s] = wibox({})
  taglistWibox[s].height = 30
  taglistWibox[s].width = 392
  taglistWibox[s].visible = true
  taglistWibox[s]:set_bg("#333333")

  wiboxPositioning(taglistWibox[s], s, 0, 0, "left", "top", "w")
  taglistWibox[s]:struts({top = taglistWibox[s].y - screen[s].geometry.y + taglistWibox[s].height + 2*taglistWibox[s].border_width })

  local layout = wibox.layout.margin()
  layout:set_margins(4)
  layout:set_widget(taglist[s])

  taglistWibox[s]:set_widget(layout)
end

