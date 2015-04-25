volWidgetText = wibox.widget.textbox()

volWidget = wibox.widget.background()
volWidget:set_widget(volWidgetText)

volFunction = function(widget, args)
  amount = args[1]
  state  = args[2]
  if state == "♩" then
    state = "M"
  end
  if state == "M" then
    volText = " " .. amount .. "% " .. state .. " "
  else
    volWidget:set_bg(beautiful.widgetBGWarning)
    volText = " <span color='" .. beautiful.widgetFGWarning .. "'>" .. amount .. "% " .. state .. "</span> "
  end
  return volText
end

vicious.register(volWidgetText, vicious.widgets.volume, volFunction, 61, "Master")

volWidgetText:buttons(awful.util.table.join(
  awful.button({}, 1, function() leftButtonVol() end),
  awful.button({}, 3, function() rightButtonVol() end),
  awful.button({}, 4, function() raiseVol() end),
  awful.button({}, 5, function() lowerVol() end)
))
