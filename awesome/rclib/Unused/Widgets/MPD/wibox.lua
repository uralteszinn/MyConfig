myMPDWibox = {}

for s=1, screen.count() do
  myMPDWibox[s]         = wibox({})
  myMPDWibox[s].width   = screen[s].geometry.width/3*2
  myMPDWibox[s].height  = 70
  myMPDWibox[s].visible = false

  wiboxPositioning(myMPDWibox[s], s, 50, 75)

  myMPDWibox[s]:set_widget(mpdWidgetText)
end
