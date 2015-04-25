volText = wibox.widget.textbox()
volText:set_align("center")
volText:set_font("27")

volTextbox = wibox.widget.background()
volTextbox:set_widget(volText)

volFunction = function(widget, args)
  local amount = args[1]
  local state  = args[2]
  local res    = ""
  if state == "♩" then
    state = "Mute"
  end
  if state == "Mute" then
    volTextbox:set_bg(volColor.bg_mute)
    volTextbox:set_fg(volColor.fg_mute)
    for s=1,screen.count() do
      volTextboxWibox[s].border_color = volColor.fg_mute
      volPBWibox[s].border_color      = volColor.fg_mute
    end
    res = " Mute "
  else
    volTextbox:set_bg(volColor.bg)
    volTextbox:set_fg(volColor.fg)
    for s=1,screen.count() do
      volTextboxWibox[s].border_color = volColor.fg
      volPBWibox[s].border_color      = volColor.fg
    end
    res = " " .. state .. "  " .. amount .. "%  " .. state .. " "
  end
  return res
end

vicious.register(volText, vicious.widgets.volume, volFunction, 61, "Master")

volText:buttons(awful.util.table.join(
  awful.button({}, 1, function() leftButtonVol() end),
  awful.button({}, 3, function() rightButtonVol() end),
  awful.button({}, 4, function() raiseVol() end),
  awful.button({}, 5, function() lowerVol() end)
))
