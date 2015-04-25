dofile(widgetPath .. "settings.lua")
dofile(widgetPath .. "functions.lua")

batID = getBatID()

if batID ~= nil and batID ~= "" then
  dofile(widgetPath .. "progressbar.lua")
  dofile(widgetPath .. "textbox.lua")
  dofile(widgetPath .. "wibox.lua")
  dofile(widgetPath .. "timer.lua")
  dofile(widgetPath .. "keys.lua")

  hadBat = true
  batRemindTimerText = "Setting up..."

  vicious.force({batPB})

  checkBat()
end
