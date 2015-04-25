wirelessInterfaceText = awful.util.pread("iwconfig")

for line in string.gmatch(wirelessInterfaceText, "[^\n]+") do
  if string.find(line, "^%w") then
    if not string.find(line, "no wireless extensions") then
      wirelessInterface = string.match(line, "^%w+") 
    end
  end
end

wlanWidgetText = wibox.widget.textbox()

wlanWidget = wibox.widget.background()
wlanWidget:set_widget(wlanWidgetText)

hadConnection = false
wlanTTIcon = beautiful.wlanEmptyTTIcon

wlanFunction = function(widget, args)
  ssid = args["{ssid}"]
  link = args["{link}"]
  linp = args["{linp}"]
  if ssid == "N/A" then
    wlanWidget:set_bg(beautiful.widgetBGWarning)
    wlanText      = " <span color='" .. beautiful.widgetFGWarning .. "'>No WLAN</span> "
    wlanTTText = "No WLAN Connection"
    if hadConnection then
      for s=1, screen.count() do
        naughty.notify({
                         screen    = s,
                         title     = "Wireless LAN",
                         text      = "No Connection",
                         icon      = wlanTTIcon,
                         icon_size = 30,
                         preset    = naughty.config.presets.critical,
                      })
      end
      wlanTTIcon = beautiful.wlanEmptyTTIcon
      hadConnection = false
    end
  else
    wlanWidget:set_bg()
    wlanText      = " <span color='" .. beautiful.widgetFGGood .. "'>" .. ssid .. "</span> "
    wlanTTText = "\n<b>Card</b> " .. wirelessInterface .. "\n<b>Network</b> " .. ssid .. "\n<b>Link Quality</b> " .. link .. "/70 (" .. linp .. "%)"
    if not hadConnection then
      for s=1, screen.count() do
        naughty.notify({
                         screen    = s,
                         title     = "Wireless LAN",
                         text      = "Connected to " .. ssid,
                         icon      = wlanTTIcon,
                         icon_size = 30,
                         preset    = naughty.config.presets.normal,
                      })
      end
      wlanTTIcon = beautiful.wlanFullTTIcon
      hadConnection = true
    end
  end
  return wlanText
end

vicious.register(wlanWidgetText, vicious.widgets.wifi, wlanFunction, 3, wirelessInterface)

-- Tooltip
wlanTT = nil
showWlanTT = function()
  wlanTT = naughty.notify({ 
                            screen    = mouse.screen,
                            title     = "Wireless LAN",
                            text      = wlanTTText,
                            icon      = wlanTTIcon,
                            icon_size = 25,
                            preset    = naughty.config.presets.tooltip,
                          })
end
deleteWlanTT = function()
  naughty.destroy(wlanTT)
end

wlanWidgetText:connect_signal("mouse::enter", showWlanTT)
wlanWidgetText:connect_signal("mouse::leave", deleteWlanTT)
