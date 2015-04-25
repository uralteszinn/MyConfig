clockToggleWibox = {}

for s = 1, screen.count() do
  clockToggleWibox[s] = wibox({})
  clockToggleWibox[s].height = 1
  clockToggleWibox[s].width = screen[s].geometry.width/4
  clockToggleWibox[s].visible = true

  if showToggleWiboxes then
    clockToggleWibox[s]:set_bg(toggleWiboxColor)
  end

  wiboxPositioning(clockToggleWibox[s], s, 100, 0, "right", "top")

  clockToggleWibox[s]:struts({top = 1})

  clockToggleWibox[s]:connect_signal("mouse::enter", showClock)
end
