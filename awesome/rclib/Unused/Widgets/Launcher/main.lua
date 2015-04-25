dofile(widgetPath .. "settings.lua")
dofile(widgetPath .. "function.lua")
dofile(widgetPath .. "textboxes.lua")
dofile(widgetPath .. "wibox.lua")

-------------------------------------------------------------

launchPrgs =  { 
  browser, 
  terminal, 
  "nautilus", 
  "mpd",
  "transmission-gtk",
} 

launchText = {
  "Browser",
  "Terminal",
  "Files",
  "MPD",
  "Transmission",
}

launcherWidget("Programs", launchText, launchPrgs, 3/5)

-------------------------------------------------------------

systemPrgs = { 
  poweroff_cmd,
  reboot_cmd,
  suspend_cmd,
  pacman_update_cmd,
}

systemText = {
  "Poweroff",
  "Reboot",
  "Suspend",
  "Update System",
}

launcherWidget("System", systemText, systemPrgs, 1/5)

-------------------------------------------------------------

awesomePrgs = { 
  awesome.quit,
  awesome.restart,
}

awesomeText = {
  "Quit Awesome",
  "Reload Awesome",
}

launcherWidget("Awesome", awesomeText, awesomePrgs, 2/5)

-------------------------------------------------------------

keyboardLayoutText = {
  "Colemak",
  "Dvorak",
  "DVP",
  "CH",
  "US",
}

keyboardLayoutPrgs = {
  function() setKeyboardLayout('us(colemak)') end,
  function() setKeyboardLayout('us(dvorak)') end,
  function() setKeyboardLayout('us(dvp)') end,
  function() setKeyboardLayout('ch') end,
  function() setKeyboardLayout('us') end,
}

keyboardLayoutWiboxes = launcherWidget("Keyboard Layout", keyboardLayoutText, keyboardLayoutPrgs, 4/5)

setKeyboardLayout('us(colemak)')
-------------------------------------------------------------

