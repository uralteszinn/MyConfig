layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.top,
  awful.layout.suit.fair,
  awful.layout.suit.fair.horizontal,
  awful.layout.suit.spiral,
  awful.layout.suit.spiral.dwindle,
  awful.layout.suit.max,
  awful.layout.suit.max.fullscreen,
  awful.layout.suit.magnifier,
  awful.layout.suit.floating,

  default    = awful.layout.suit.tile,
  max        = awful.layout.suit.max,
  fullscreen = awful.layout.suit.max.fullscreen,
  horizontal = awful.layout.suit.tile.bottom,
  vertical   = awful.layout.suit.tile,
}

-- Keys

globalkeys = awful.util.table.join(globalkeys,
  awful.key({ "Mod4"            }, "f",     function () awful.layout.set(layouts.fullscreen) end),
  awful.key({ "Mod4"            }, "m",     function () awful.layout.set(layouts.max) end),
  awful.key({ "Mod4"            }, "h",     function () awful.layout.set(layouts.horizontal) end),
  awful.key({ "Mod4"            }, "v",     function () awful.layout.set(layouts.vertical) end),
  awful.key({ "Mod4"            }, "d",     function () awful.layout.set(layouts.default) end),

  awful.key({ "Mod4",           }, "space", function () awful.layout.inc(layouts,  1) end),
  awful.key({ "Mod4", "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end)
)
