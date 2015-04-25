volTextbox = wibox.widget.textbox()
volTextbox:set_align("center")
volTextbox:set_font("20")

volWidget = wibox.widget.background()
volWidget:set_widget(volTextbox)

volFunction = function(widget, args)
  local amount = args[1]
  local state  = args[2]
  local res    = ""
  if state == "♩" then
    state = "Mute"
  end
  title = "<span font='8'>Volume</span>\n"
  if state == "Mute" then
    volWidget:set_bg()
    volWidget:set_fg(volColor.fg_mute)
    res = title .. "Mute"
  else
    volWidget:set_bg()
    volWidget:set_fg(volColor.fg)
    res = title .. amount .. "%"
  end
  
  return res
end

vicious.register(volTextbox, vicious.widgets.volume, volFunction, 61, "Master")

volTextbox:buttons(awful.util.table.join(
  awful.button({}, 1, function() leftButtonVol() end),
  awful.button({}, 3, function() rightButtonVol() end),
  awful.button({}, 4, function() raiseVol() end),
  awful.button({}, 5, function() lowerVol() end)
))
