dofile(widgetPath .. "settings.lua")
dofile(widgetPath .. "functions.lua")

wirelessInterface = getWirelessInterface()

if wirelessInterface then
  dofile(widgetPath .. "textbox.lua")
  dofile(widgetPath .. "wibox.lua")

  vicious.force({wlanTextbox})
end
