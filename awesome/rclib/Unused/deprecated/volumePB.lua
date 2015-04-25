volPB = awful.widget.progressbar()

volPBfunction = function(widget,args) 
  amount = args[1]
  state  = args[2]
  if state == "♩" then
    state = "M"
  end
  if state == "M" then
    volPB:set_color(beautiful.widgetFGNormal)
  else
    volPB:set_color(beautiful.widgetFGWarning)
  end
  return amount
end

vicious.register(volPB, vicious.widgets.volume, volPBfunction, 32, "Master")

volPB:buttons(awful.util.table.join(
  awful.button({}, 1, function() leftButtonVol() end),
  awful.button({}, 3, function() rightButtonVol() end),
  awful.button({}, 4, function() raiseVol() end),
  awful.button({}, 5, function() lowerVol() end)
))
