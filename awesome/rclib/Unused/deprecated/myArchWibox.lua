myArchIcon = {}
myArch = {}
myArchWibox = {}

for s=1, screen.count() do
  myArchIcon[s] = wibox.widget.imagebox()
  myArchIcon[s]:set_image(ico_path .. "archlinuxGray.png")
  myArch[s] = wibox.widget.background()
  myArch[s]:set_widget(myArchIcon[s])
  myArch[s]:connect_signal("mouse::enter", function() myArchIcon[s]:set_image(ico_path .. "archlinux.png") end)
  myArch[s]:connect_signal("mouse::leave", function() myArchIcon[s]:set_image(ico_path .. "archlinuxGray.png") end)
  myArch[s]:buttons(awful.util.table.join(
    awful.button({}, 1, function() showSystemWibox() end)
  ))

  myArchWibox[s] = wibox({})
  myArchWibox[s].width = 100
  myArchWibox[s].height = 33
  myArchWibox[s].visible = true

  myArchWibox[s].x = screen[s].geometry.x
  myArchWibox[s].y = screen[s].geometry.y + screen[s].geometry.height - (myArchWibox[s].height + 2*myArchWibox[s].border_width)

  myArchWibox[s]:set_widget(myArch[s])
end
