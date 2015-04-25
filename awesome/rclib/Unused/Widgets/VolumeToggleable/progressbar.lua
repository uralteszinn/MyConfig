volPB = awful.widget.progressbar()

volPBfunction = function(widget,args) 
  local amount = args[1]
  local state  = args[2]
  if state == "♩" then
    state = "M"
  end
  if state == "M" then
    volPB:set_color(volColor.fg_mute)
  else
    volPB:set_color(volColor.fg)
  end
  return amount
end

vicious.register(volPB, vicious.widgets.volume, volPBfunction, 57, "Master")

volPB:buttons(awful.util.table.join(
  awful.button({}, 1, function() leftButtonVol() end),
  awful.button({}, 3, function() rightButtonVol() end),
  awful.button({}, 4, function() raiseVol() end),
  awful.button({}, 5, function() lowerVol() end)
))
