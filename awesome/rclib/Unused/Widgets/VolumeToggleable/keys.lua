globalkeys = awful.util.table.join(globalkeys,
  awful.key({ }, "XF86AudioRaiseVolume", function () raiseVol()  end),
  awful.key({ }, "XF86AudioLowerVolume", function () lowerVol()  end),
  awful.key({ }, "XF86AudioMute"       , function () toggleVol() end)
)
