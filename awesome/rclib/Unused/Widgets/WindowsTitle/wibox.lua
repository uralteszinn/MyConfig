windowsTitleWibox = {}

for s=1,screen.count() do
  windowsTitleWibox[s] = wibox({})
  windowsTitleWibox[s].width = windowsTitleWidth
  windowsTitleWibox[s].height = windowsTitleHeight
  windowsTitleWibox[s].visible = true
  windowsTitleWibox[s].ontop = false
  windowsTitleWibox[s]:set_bg(windowsTitleColor.bg)

  wiboxPositioning(windowsTitleWibox[s], s, 50, 0, "center", "top")

  local windowsTitleMarginLayout = wibox.layout.margin()
  windowsTitleMarginLayout:set_margins(8)
  windowsTitleMarginLayout:set_widget(windowsTitle[s].background)
  
  local windowsTitleLayout = wibox.layout.align.horizontal()
  if showWindowsTitleIcon then
    windowsTitleLayout:set_left(windowsTitle[s].icon)
  end
  windowsTitleLayout:set_middle(windowsTitleMarginLayout)
  if showWindowsTitleIcon then
    windowsTitleLayout:set_right(windowsTitle[s].icon)
  end

  windowsTitleWibox[s]:set_widget(windowsTitleLayout)
end
