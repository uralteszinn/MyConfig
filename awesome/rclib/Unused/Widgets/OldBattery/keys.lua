globalkeys = awful.util.table.join(globalkeys,
  awful.key({ modkey            }, "F1",    function () hideBat() end),
  awful.key({ modkey, "Shift"   }, "F1",    function () toggleBat() end)
)
