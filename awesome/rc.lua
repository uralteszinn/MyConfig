gears           = require("gears")
awful           = require("awful")
awful.autofocus = require("awful.autofocus")
awful.rules     = require("awful.rules")
wibox           = require("wibox")
--menubar         = require("menubar")
beautiful       = require("beautiful")
naughty         = require("naughty")

vicious         = require("vicious")

--inspect         = require("inspect")

------------------------------------------------------------------------------

cfg_path = awful.util.getdir("config") .. "/"
lib_path = cfg_path .. "rclib/"

dofile(lib_path .. "variables.lua")
dofile(lib_path .. "functions.lua")

------------------------------------------------------------------------------

globalkeys    = {}
globalbuttons = {}
clientkeys    = {}
clientbuttons = {}

globalkeys = awful.util.table.join(globalkeys,
  awful.key({ modkey, "Control" }, "r", awesome.restart),
  awful.key({ modkey, "Shift"   }, "q", awesome.quit)
)

------------------------------------------------------------------------------

showToggleWiboxes = false
toggleWiboxColor  = "#ff0000"

getComputerProperties()

------------------------------------------------------------------------------

doBase("beautiful")     --<-- mandatory
doBase("naughtyConfig")
doBase("layouts")       --<-- mandatory
doBase("tags")          --<-- mandatory
doBase("screen")
doBase("client")
doBase("bindings")

-- order matters (because of struts)
doWidget("Volume", 1)
doWidget("Clock", 1)
doWidget("Battery", 1)
doWidget("Internet", 1)
doWidget("WLAN", 1)
doWidget("Tray", 1)
--doWidget("WindowsTitle",7)
--doWidget("Taglist", 1)
doWidget("TaglistVertical", 1)
doWidget("Layoutbox", 5)
doWidget("Run", 3)
--doWidget("Mount", 10)
--doWidget("Launcher", 8)
doWidget("Birthday", 10)
--doWidget("MPD", 10)
--doWidget("FileManager", 10)

--doExtended("Expose")

doBase("rules")
doBase("signals")
doBase("autostart")

------------------------------------------------------------------------------

root.keys(globalkeys)
root.buttons(globalbuttons)
