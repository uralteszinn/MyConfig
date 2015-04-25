tags = {}
for s = 1, screen.count() do
  tags[s] = awful.tag(
    { "www" , "term" , "vim", "pdf", "files", "music", "movie", "play", "other" }, s, 
    {layouts.default, layouts.default, layouts.max, layouts.max, layouts.max, layouts.max, layouts.max, layouts.max, layouts.max }
  )
end

--Keys

globalkeys = awful.util.table.join(globalkeys,
  awful.key({ modkey,           }, "Left" , awful.tag.viewprev ),
  awful.key({ modkey,           }, "Right", awful.tag.viewnext ),
  awful.key({ modkey, "Shift"   }, "#43"  , awful.tag.viewprev ),
  awful.key({ modkey, "Shift"   }, "#46"  , awful.tag.viewnext ),

  awful.key({ modkey,           }, "#44", function () awful.tag.viewonly(tags[mouse.screen][1]) end),
  awful.key({ modkey,           }, "#45", function () awful.tag.viewonly(tags[mouse.screen][2]) end),
  awful.key({ modkey,           }, "#46", function () awful.tag.viewonly(tags[mouse.screen][3]) end),
  awful.key({ modkey,           }, "#47", function () awful.tag.viewonly(tags[mouse.screen][4]) end),

  awful.key({ modkey,           }, "#30", function () awful.tag.viewonly(tags[mouse.screen][5]) end),
  awful.key({ modkey,           }, "#31", function () awful.tag.viewonly(tags[mouse.screen][6]) end),
  awful.key({ modkey,           }, "#32", function () awful.tag.viewonly(tags[mouse.screen][7]) end),
  awful.key({ modkey,           }, "#33", function () awful.tag.viewonly(tags[mouse.screen][8]) end),
  awful.key({ modkey,           }, "#34", function () awful.tag.viewonly(tags[mouse.screen][9]) end),
  
  awful.key({ modkey, "Shift"   }, "#30", function () awful.tag.viewmore({ tags[mouse.screen][1], tags[mouse.screen][2] }) end),
  awful.key({ modkey, "Shift"   }, "#31", function () awful.tag.viewmore({ tags[mouse.screen][1], tags[mouse.screen][3] }) end),
  awful.key({ modkey, "Shift"   }, "#32", function () awful.tag.viewmore({ tags[mouse.screen][2], tags[mouse.screen][3] }) end),
  awful.key({ modkey, "Shift"   }, "#33", function () awful.tag.viewmore({ tags[mouse.screen][3], tags[mouse.screen][4] }) end)
)

keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

for i = 1, keynumber do
  globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey }, "#" .. i + 9,
      function ()
        local screen = mouse.screen
        if tags[screen][i] then
          awful.tag.viewonly(tags[screen][i])
        end
      end
    ),
    awful.key({ modkey, "Control" }, "#" .. i + 9,
      function ()
        local screen = mouse.screen
        if tags[screen][i] then
          awful.tag.viewtoggle(tags[screen][i])
        end
      end
    ),
    awful.key({ modkey, "Shift" }, "#" .. i + 9,
      function ()
        if client.focus and tags[client.focus.screen][i] then
          local screen = client.focus.screen
          awful.client.movetotag(tags[screen][i])
          awful.tag.viewonly(tags[screen][i])
        end
      end
    ),
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
      function ()
        if client.focus and tags[client.focus.screen][i] then
          awful.client.toggletag(tags[client.focus.screen][i])
        end
      end
    )
  )
end
