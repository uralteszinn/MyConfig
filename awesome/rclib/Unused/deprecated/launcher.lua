myLauncherIcon = {}
myLauncher = {}

for s=1, screen.count() do
  myLauncherIcon[s] = {}
  myLauncher[s] = {}
  for i, prg in ipairs(launchPrgs) do
    myLauncherIcon[s][i] = wibox.widget.imagebox()
    myLauncherIcon[s][i]:set_image(ico_path .. launchIconsNotFocused[i])
    myLauncherIcon[s][i]:connect_signal("mouse::enter", function() myLauncherIcon[s][i]:set_image(ico_path .. launchIconsFocused[i]) end)
    myLauncherIcon[s][i]:connect_signal("mouse::leave", function() myLauncherIcon[s][i]:set_image(ico_path .. launchIconsNotFocused[i]) end)

    myLauncher[s][i] = wibox.widget.background()
    myLauncher[s][i]:set_widget(myLauncherIcon[s][i])

    myLauncher[s][i]:buttons(awful.util.table.join(
      awful.button({ }, 1, function () awful.util.spawn(prg) end)
    ))
  end
end
