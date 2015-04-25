layoutboxWibox = {}

for s=1, screen.count() do
  layoutboxWibox[s]         = wibox({})
  layoutboxWibox[s].width   = layoutboxSize
  layoutboxWibox[s].height  = layoutboxSize
  layoutboxWibox[s].ontop   = true

  wiboxPositioning(layoutboxWibox[s], s, 50, 50)

  layoutboxWibox[s]:set_widget(awful.widget.layoutbox(s))
end
