globalkeys = awful.util.table.join(globalkeys,
  awful.key({                   }, "XF86AudioPlay", mpdToggle),
  awful.key({                   }, "XF86AudioPrev", mpdPrev),
  awful.key({                   }, "XF86AudioNext", mpdNext),
  awful.key({ modkey            }, "XF86AudioPrev", mpdBackwardStep),
  awful.key({ modkey            }, "XF86AudioNext", mpdForwardStep),
  awful.key({ modkey, "Shift"   }, "XF86AudioPrev", mpdBackwardLeap),
  awful.key({ modkey, "Shift"   }, "XF86AudioNext", mpdForwardLeap)
)
