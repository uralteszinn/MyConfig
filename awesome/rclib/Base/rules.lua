awful.rules.rules = {
  ------------------------------------------------------------
  { rule       = { },
    properties = { border_width     = beautiful.border_width,
                   border_color     = beautiful.border_normal,
                   size_hints_honor = false,
                   focus            = true,
                   keys             = clientkeys,
                   buttons          = clientbuttons },
                 
    --callback   = function(c)
                   --awful.titlebar.add(c, { modkey = modkey, bg_focus = beautiful.client_bg_focus })
                 --end
    callback   = function(c)      
                   local titlebars_enabled = true
                   if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
                       local space = wibox.widget.textbox(" ")
                       -- Widgets that are aligned to the left
                       local left_layout = wibox.layout.fixed.horizontal()
                       left_layout:add(awful.titlebar.widget.iconwidget(c))
                       left_layout:add(space)

                       -- Widgets that are aligned to the right
                       local right_layout = wibox.layout.fixed.horizontal()
                       right_layout:add(awful.titlebar.widget.floatingbutton(c))
                       right_layout:add(awful.titlebar.widget.maximizedbutton(c))
                       right_layout:add(awful.titlebar.widget.stickybutton(c))
                       right_layout:add(awful.titlebar.widget.ontopbutton(c))
                       right_layout:add(awful.titlebar.widget.closebutton(c))

                       -- The title goes in the middle
                       local title = awful.titlebar.widget.titlewidget(c)
                       title:buttons(awful.util.table.join(
                               awful.button({ }, 1, function()
                                   client.focus = c
                                   c:raise()
                                   awful.mouse.client.move(c)
                               end),
                               awful.button({ }, 3, function()
                                   client.focus = c
                                   c:raise()
                                   awful.mouse.client.resize(c)
                               end)
                               ))

                       -- Now bring it all together
                       local layout = wibox.layout.align.horizontal()
                       layout:set_left(left_layout)
                       layout:set_right(right_layout)
                       layout:set_middle(title)

                       awful.titlebar(c):set_widget(layout)
                   end
                 end
                 },
  ------------------------------------------------------------
  { rule_any   = { class = { "Gxmessage", "Xmessage" } },
    properties = { floating = true }, 
    callback   = function(c)
                   awful.placement.centered(c)
                 end },
  ------------------------------------------------------------
  { rule       = { class = "URxvt" },
    callback   = function(c) 
                   c:tags({tags[mouse.screen][2]}) 
                   awful.tag.viewonly(tags[mouse.screen][2])
                 end },
  ------------------------------------------------------------
  { rule       = { class = "Gvim" },
    callback   = function(c) 
                   c:tags({tags[mouse.screen][3]}) 
                   awful.tag.viewonly(tags[mouse.screen][3])
                 end },
  ------------------------------------------------------------
  { rule_any   = { class = { "Dwb", "Firefox" } },
    properties = { floating = false, },
    callback   = function(c) 
                   c:tags({tags[mouse.screen][1]}) 
                   awful.tag.viewonly(tags[mouse.screen][1])
                 end },
  ------------------------------------------------------------
  { rule       = { class = "Evince" },
    callback   = function(c) 
                   c:tags({tags[mouse.screen][4]}) 
                 end },
  ------------------------------------------------------------   
  { rule       = { class = "Nautilus" },
    callback   = function(c) 
                   c:tags({tags[mouse.screen][5]}) 
                   awful.tag.viewonly(tags[mouse.screen][5])
                 end },
  ------------------------------------------------------------   
  { rule       = { class = "Clementine" },
    callback   = function(c) 
                   c:tags({tags[mouse.screen][6]}) 
                   awful.tag.viewonly(tags[mouse.screen][6])
                 end },
  ------------------------------------------------------------   
  { rule       = { class = "Spotify" },
    callback   = function(c) 
                   c:tags({tags[mouse.screen][6]}) 
                   awful.tag.viewonly(tags[mouse.screen][6])
                 end },
  ------------------------------------------------------------   
  { rule_any   = { class = {"Vlc", "MPlayer", "smplayer"} },
    callback   = function(c) 
                   c:tags({tags[mouse.screen][7]}) 
                   awful.tag.viewonly(tags[mouse.screen][7])
                 end },
  ------------------------------------------------------------   
  --{ rule       = { class = {"bzflag"} },
    --callback   = function(c) 
                   --c:tags({tags[mouse.screen][8]}) 
                   --awful.tag.viewonly(tags[mouse.screen][8])
                 --end },
  ------------------------------------------------------------   
  { rule_any    = { class = { "libreoffice-startcenter", 
                              "libreoffice-writer", 
                              "libreoffice-calc", 
                              "libreoffice-impress" } },
    callback   = function(c) 
                   c:tags({tags[mouse.screen][9]}) 
                 end },
  ------------------------------------------------------------   
  { rule       = { class = "Kmymoney" },
    callback   = function(c) 
                   c:tags({tags[mouse.screen][9]}) 
                 end },
  { rule       = { class = "Kmymoney", name = "Schedules" },
    properties = { floating = true}, 
    callback   = function(c) 
                   c:tags({tags[mouse.screen][9]}) 
                 end },
  ------------------------------------------------------------   
  { rule       = { class = "Gimp" },
    properties = { floating = true}, 
    callback   = function(c) 
                   c:tags({tags[mouse.screen][9]}) 
                 end },
  ------------------------------------------------------------   
  { rule       = { class = "Transmission-gtk" },
    callback   = function(c) 
                   c:tags({tags[mouse.screen][9]}) 
                 end },
  ------------------------------------------------------------   
  { rule       = { class = "Wine" },
    callback   = function(c) 
                   c:tags({tags[mouse.screen][9]}) 
                 end },
  ------------------------------------------------------------
}
