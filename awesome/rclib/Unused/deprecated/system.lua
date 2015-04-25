mySystemIcon = {}
mySystem = {}

for s=1, screen.count() do
  mySystemIcon[s] = {}
  mySystem[s] = {}
  for i, prg in ipairs(systemPrgs) do
    mySystemIcon[s][i] = wibox.widget.imagebox()
    mySystemIcon[s][i]:set_image(ico_path .. systemIconsNotFocused[i])
    mySystemIcon[s][i]:connect_signal("mouse::enter", function() mySystemIcon[s][i]:set_image(ico_path .. systemIconsFocused[i]) end)
    mySystemIcon[s][i]:connect_signal("mouse::leave", function() mySystemIcon[s][i]:set_image(ico_path .. systemIconsNotFocused[i]) end)

    mySystem[s][i] = wibox.widget.background()
    mySystem[s][i]:set_widget(mySystemIcon[s][i])

    mySystem[s][i]:buttons(awful.util.table.join(
      awful.button({ }, 1, function () awful.util.spawn(prg) end)
    ))
  end
end
