globalkeys = awful.util.table.join(globalkeys,
  awful.key({ modkey, "Control" }, "#44",   function () awful.screen.focus_relative( 1) end),
  awful.key({ modkey, "Control" }, "#45",   function () awful.screen.focus_relative(-1) end),
  awful.key({ modkey, "Control" }, "Left",  function () awful.screen.focus_relative( 1) end),
  awful.key({ modkey, "Control" }, "Right", function () awful.screen.focus_relative(-1) end)
)
