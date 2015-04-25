myBirthdayWibox = {}

for s=1, screen.count() do
  local width = 24
  if displayBirthdayIcons then
    width = width + 2*birthdayIconSize
  end
  for k=0, string.len(birthdayIconText) do
    width = width + 8
  end
  myBirthdayWibox[s]         = wibox({})
  myBirthdayWibox[s].width   = width
  myBirthdayWibox[s].height  = birthdayIconSize
  myBirthdayWibox[s].visible = true

  wiboxPositioning(myBirthdayWibox[s], s, 50, 25)

  local marginLayout = wibox.layout.margin()
  marginLayout:set_margins(8)
  marginLayout:set_widget(birthdayWidgetText)
  local layout = wibox.layout.align.horizontal()

  layout:set_middle(marginLayout)
  if displayBirthdayIcons then
    layout:set_left(birthdayImage)
    layout:set_right(birthdayImage)
  end
  myBirthdayWibox[s]:set_widget(layout)

  myBirthdayWibox[s]:connect_signal("mouse::enter", showBirthdayTT)
  myBirthdayWibox[s]:connect_signal("mouse::leave", deleteBirthdayTT)
end
