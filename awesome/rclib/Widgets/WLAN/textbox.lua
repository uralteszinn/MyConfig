wlanTextbox = wibox.widget.textbox()
wlanTextbox:set_markup("Setting up ...")
wlanTextbox:set_font("8")
wlanTextbox:set_align("center")

wlanFunction = function(widget, args)
  ssid = args["{ssid}"]
  link = args["{link}"]
  linp = args["{linp}"]
  title = "<span font='20'>WLAN</span>\n"
  if ssid == "N/A" then
    wlanWidget:set_fg(wlanColor.fg_urgent)
    wlanWidget:set_bg()
    wlanText = "No Connection"
  else
    wlanWidget:set_fg(wlanColor.fg)
    wlanWidget:set_bg()
    wlanText = ssid
  end
  return title .. wlanText
end

vicious.register(wlanTextbox, vicious.widgets.wifi, wlanFunction, 3, wirelessInterface)

wlanWidget = wibox.widget.background()
wlanWidget:set_widget(wlanTextbox)
