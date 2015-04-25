dofile(widgetPath .. "functions.lua")
dofile(widgetPath .. "textbox.lua")
dofile(widgetPath .. "wibox.lua")
dofile(widgetPath .. "keys.lua")

wiboxesVisible = false

startProg("mpd", "")

vicious.force({mpdWidgetText})
