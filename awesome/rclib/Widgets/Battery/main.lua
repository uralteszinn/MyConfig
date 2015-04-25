dofile(widgetPath .. "settings.lua")
dofile(widgetPath .. "functions.lua")

currentBatIDs = {}
previousBatIDs = {}
batteries = {}

dofile(widgetPath .. "spaceTextbox.lua")
dofile(widgetPath .. "wibox.lua")
dofile(widgetPath .. "timer.lua")

checkBat()
