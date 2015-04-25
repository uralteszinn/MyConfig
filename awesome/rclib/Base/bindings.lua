-- Everything else
globalkeys = awful.util.table.join(globalkeys,
  awful.key({ modkey,           }, "Return"              , function () awful.util.spawn(terminal) end),

  awful.key({                   }, "XF86Sleep"           , function () awful.util.spawn(suspend_cmd) end),
  awful.key({                   }, "XF86PowerOff"        , function () awful.util.spawn(poweroff_cmd) end),
  awful.key({ modkey, "Shift"   }, "Delete"              , function () awful.util.spawn(poweroff_cmd) end),
  awful.key({                   }, "XF86WWW"             , function() awful.util.spawn(browser) end),
  awful.key({                   }, "XF86HomePage"        , function() awful.util.spawn(browser) end),
  awful.key({                   }, "XF86Eject"           , function() awful.util.spawn("eject") end),

  awful.key({ modkey,           }, "b", function() awful.util.spawn(browser) end)
)

-- Widget Handling (to be placed somewhere else!)
globalbuttons = awful.util.table.join(globalbuttons,
  awful.button({ }, 10, function() expose(mouse.screen) end)
)
