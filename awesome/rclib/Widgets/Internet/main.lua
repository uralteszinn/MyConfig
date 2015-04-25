dofile(widgetPath .. "settings.lua")
dofile(widgetPath .. "functions.lua")

interfaces = getInterfaces()

dofile(widgetPath .. "textbox.lua")
dofile(widgetPath .. "wibox.lua")
dofile(widgetPath .. "timer.lua")
dofile(widgetPath .. "bindings.lua")

haveInternet = false
hadInternet  = false

internetFunction()
