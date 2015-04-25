globalkeys = awful.util.table.join(globalkeys,
  awful.key({ modkey, "Shift"   }, "#44",
    function ()
      awful.client.focus.byidx(1)
      if client.focus then client.focus:raise() end
    end
  ),
  awful.key({ modkey, "Shift"   }, "#45",
    function ()
      awful.client.focus.byidx(-1)
      if client.focus then client.focus:raise() end
    end
  ),
  awful.key({ modkey,           }, "Tab",
    function ()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end
  )
)

-- They will be assigned to clients
clientkeys = awful.util.table.join(clientkeys,
  awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
  awful.key({ modkey, "Shift"   }, "Return", function (c) c:kill()                         end),
  awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
  awful.key({ modkey,           }, "/",      awful.client.movetoscreen                        ),
  awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
  awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
  awful.key({ modkey, "Shift"   }, "m",
    function (c)
      c.maximized_horizontal = not c.maximized_horizontal
      c.maximized_vertical   = not c.maximized_vertical
    end
  )
)

clientbuttons = awful.util.table.join(clientbuttons,
  awful.button({                  },  1, function (c) client.focus = c; c:raise() end),
  awful.button({ modkey           },  1, awful.mouse.client.move),
  awful.button({ modkey , "Shift" },  1, awful.mouse.client.dragtotag.widget),
  awful.button({ modkey           },  3, awful.mouse.client.resize),
  awful.button({                  }, 10, function (c) expose(mouse.screen) end)
)
