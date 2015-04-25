clockWibox = {}

for s=1, screen.count() do
  clockWibox[s]         = wibox({})
  clockWibox[s].ontop   = true
  clockWibox[s].width   = clockWidth
  clockWibox[s].height  = clockHeigth

  clockWibox[s].border_width = clockBorderWidth
  clockWibox[s].border_color = clockColor.border

  clockWibox[s]:set_widget(clockTextbox)
end
