myTextLauncherText = {}
myTextLauncher = {}

myTextLauncherTitleText = wibox.widget.textbox()
myTextLauncherTitleText:set_markup("<b>Programs</b>\n")
myTextLauncherTitleText:set_align("center")


myTextLauncherTitle = wibox.widget.background()
myTextLauncherTitle:set_widget(myTextLauncherTitleText)
myTextLauncherTitle:set_bg("#888888")
myTextLauncherTitle:set_fg("#000000")
myTextLauncherTitle:fit(150,20)

for s=1, screen.count() do
  myTextLauncherText[s] = {}
  myTextLauncher[s] = {}

  for i, prg in ipairs(launchPrgs) do
    myTextLauncherText[s][i] = wibox.widget.textbox()
    myTextLauncherText[s][i]:set_text(launchText[i])
    myTextLauncherText[s][i]:set_align("center")


    myTextLauncher[s][i] = wibox.widget.background()
    myTextLauncher[s][i]:set_widget(myTextLauncherText[s][i])
    myTextLauncher[s][i]:set_bg("#050505")
    myTextLauncher[s][i]:set_fg("#888888")

    myTextLauncher[s][i]:connect_signal("mouse::enter", function() 
                                                          myTextLauncher[s][i]:set_bg("#111111") 
                                                          myTextLauncher[s][i]:set_fg("#888888")
                                                        end)
    myTextLauncher[s][i]:connect_signal("mouse::leave", function() 
                                                          myTextLauncher[s][i]:set_bg("#050505") 
                                                          myTextLauncher[s][i]:set_fg("#888888")
                                                        end)

    myTextLauncher[s][i]:buttons(awful.util.table.join(
      awful.button({ }, 1, function () awful.util.spawn(prg) end)
    ))
  end
end
