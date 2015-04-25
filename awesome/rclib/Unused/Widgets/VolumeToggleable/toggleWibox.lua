volToggleWibox = {}

for s = 1, screen.count() do
  volToggleWibox[s] = wibox({})
  volToggleWibox[s].height = 1
  volToggleWibox[s].width = screen[s].geometry.width/4
  volToggleWibox[s].visible = true

  if showToggleWiboxes then
    volToggleWibox[s]:set_bg(toggleWiboxColor)
  end

  wiboxPositioning(volToggleWibox[s], s, 50, 0, "center", "top")

  volToggleWibox[s]:struts({top = 1})

  volToggleWibox[s]:connect_signal("mouse::enter", showVol)
end
