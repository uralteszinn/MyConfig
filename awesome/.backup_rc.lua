require("awful")
require("awful.autofocus")
require("awful.rules")
require("beautiful")
require("naughty")
require("vicious")

beautiful.init("/usr/share/awesome/themes/default/theme.lua")


-------- Variables --------
terminal = "urxvtc"
browser = "firefox"
networkmanager = "wicd-client -n"
applauncher = "dmenu_run"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod1"





-------- Layouts --------
layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.max,
  awful.layout.suit.tile.bottom,
}





-------- Tags --------
tags = {}
for s = 1, screen.count() do
  -- Each screen has its own tag table.
  tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
end




-------- Menu --------
myawesomemenu = {
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
  { "restart", awesome.restart },
  { "quit", awesome.quit }
}

mycomputermenu = {
  { "log off", awesome.quit },
  { "sleep", "" },
  { "restart", "sudo reboot" },
  { "shut down", "sudo poweroff" }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
    { "computer", mycomputermenu },
    { "terminal", terminal },
    { "browser", browser },
    { "applauncher", applauncher },
    { "networkm" , networkmanager },
  }
})

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon), menu = mymainmenu })





-------- Wibox --------
mytextclock = awful.widget.textclock({ align = "right" })
mysystray = widget({ type = "systray" })
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
  awful.button({ }, 1, awful.tag.viewonly),
  awful.button({ modkey }, 1, awful.client.movetotag),
  awful.button({ }, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, awful.client.toggletag),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
)
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
  awful.button({ }, 1, 
    function (c)
       if not c:isvisible() then
         awful.tag.viewonly(c:tags()[1])
       end
       client.focus = c
       c:raise()
    end
  ),
  awful.button({ }, 3,
    function ()
      if instance then
        instance:hide()
        instance = nil
      else
        instance = awful.menu.clients({ width=250 })
      end
    end
  ),
  awful.button({ }, 4, 
    function ()
      awful.client.focus.byidx(1)
      if client.focus then client.focus:raise() end
    end
  ),
  awful.button({ }, 5, 
    function ()
      awful.client.focus.byidx(-1)
      if client.focus then client.focus:raise() end
    end
  )
)


------------------------------------------------------------------------------------------

--Second Wibox
mywibox2 = {}

--Seperator
sep = widget({ type = "textbox"})
sep.text = " "
sep.bg = beautiful.bg_focus

--Create a battery widget
batwidget = widget({type="textbox"})
bat_limit = 12
old_state = bat_limit + 1
vicious.register(batwidget,vicious.widgets.bat,
  function(widget,args)
    mode=args[1]
    state=tonumber(args[2])
    remaining_time = args[3]
    -- Notification
    if state > bat_limit then
      old_state = bat_limit + 1
    else 
      if mode == "+" then
        old_state = state
      elseif mode == "-" then
        if state + 1 == old_state then
          old_state = state
          naughty.notify({
          timeout = 10, 
          position = "top_left",
          title = "BATTERY", 
          text = "Only " .. state .. "% power left!!!", 
          fg = beautiful.fg_urgent, 
          bg = beautiful.bg_urgent
        })
        elseif old_state >= state + 1 then
          old_state = state
        end
      end
    end
    -- Widget
    if mode == "+" then
      widget.bg = beautiful.bg_normal
      if state == 100 then
        widget.bg = "#008800"
        return "<span color='#000000'> BAT Fully charged! </span>"
      end
      if string.find(remaining_time, '^%d%d:%d%d$') then
        return " BAT " .. state .. "% Charging... " .. remaining_time .. " "
      else
        return " BAT " .. state .. "% Charging... "
      end
    elseif mode == "-" then
      if  state <= bat_limit then
        widget.bg = beautiful.bg_urgent
        if string.find(remaining_time, '^%d%d:%d%d$') then
          return "<span color='" .. beautiful.fg_urgent .."'> BAT " .. state .. "% " .. remaining_time .. " </span>"
        else
          return "<span color='" .. beautiful.fg_urgent .."'> BAT " .. state .. "% </span>"
        end
      else
        widget.bg = beautiful.bg_normal
        if string.find(remaining_time, '^%d%d:%d%d$') then
          return " BAT " .. state .. "% " .. remaining_time .. " "
        else
          return " BAT " .. state .. "% "
        end
      end
    elseif string.find(mode, '[^+-]') and state >= 99 then
      widget.bg = "#008800"
      return "<span color='#000000'> BAT Fully charged! </span>"
    elseif string.find(mode, '[^+-]') and state == 0 then
      widget.bg = "#ffa500"
      return "<span color='#000000'> BAT No Battery! </span>"
    else
      widget.bg = "#ffff00"
      return "<span color='#000000'> BAT Error! </span>"
    end
  end, 1, "BAT0")

--Create a wifi Widget
wifiwidget = widget({ type = "textbox" })
vicious.register(wifiwidget, vicious.widgets.wifi,
  function(widget,args)
    if tonumber(args["{link}"]) == 0 then
      if widget.text==nil or string.find(widget.text,"S") then
        naughty.notify({
          timeout = 7, 
          position = "top_left",
          title = "WLAN", 
          text="No Connection!!!", 
          run=function() 
                awful.util.spawn(networkmanager) 
              end, 
          fg = beautiful.fg_urgent, 
          bg = beautiful.bg_urgent
        })
      end
      widget.bg = beautiful.bg_urgent
      return "<span color='" .. beautiful.fg_urgent .. "'> WLAN No Connection! </span>"
    else
      widget.bg = beautiful.bg_normal
      return " WLAN " .. args["{link}"] .. "% SSID: " .. args["{ssid}"] .. " "
    end
  end ,5,"wlan0")
wifiwidget:buttons(awful.util.table.join(
  awful.button({ },1,function() awful.util.spawn(networkmanager) end)
))

--Create a volume widget
volwidget = widget({type = "textbox"})
--vicious.register(volwidget,vicious.widgets.volume," VOL $1% ",1,"Master")
vicious.register(volwidget,vicious.widgets.volume,
  function(widget,args)
    if args[1] > 0 then
      widget.bg = beautiful.bg_urgent
      return "<span color='" .. beautiful.fg_urgent .. "'> VOL " .. args[1] .. "% </span>"
    else
      widget.bg = beautiful.bg_normal
      return " VOL " .. args[1] .. "% "
    end 
  end,1,"Master")
volwidget:buttons(awful.util.table.join(
  awful.button({ },1,function() awful.util.spawn("amixer -c 0 set Master playback 0") end)
))

--Create a network widget
netwidget = widget({ type = "textbox" })
vicious.register(netwidget,vicious.widgets.net," UP ${wlan0 up_kb} DOWN ${wlan0 down_kb} ",5)

--Create a cpu widget
cpuwidget = widget({ type = "textbox" })
vicious.register(cpuwidget,vicious.widgets.cpu," CPU $1% " ,5 )

--Create a fs widget
fswidget = widget({ type = "textbox" })
vicious.register(fswidget,vicious.widgets.fs," FS ROOT ${/ used_gb} HOME ${/home used_gb} " , 60 )

------------------------------------------------------------------------------------------




-------- Fill the screen --------
for s = 1, screen.count() do
  mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
  mylayoutbox[s] = awful.widget.layoutbox(s)
  mylayoutbox[s]:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
    awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
    awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
    awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)
  ))
  mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)
  mytasklist[s] = awful.widget.tasklist(
    function(c)
      return awful.widget.tasklist.label.currenttags(c, s)
    end, 
    mytasklist.buttons
  )
  mywibox[s] = awful.wibox({ position = "top", screen = s })
  mywibox[s].widgets = {
    {
      mylauncher,
      mytaglist[s],
      mypromptbox[s],
      layout = awful.widget.layout.horizontal.leftright
    },
    mylayoutbox[s],
    mytextclock,
    s == 1 and mysystray or nil,
    mytasklist[s],
    layout = awful.widget.layout.horizontal.rightleft
  }
  mywibox2[s] = awful.wibox({ position = "bottom", screen = s})
  mywibox2[s].height = 15
  mywibox2[s].widgets = {
    {
      wifiwidget,sep,
      netwidget,sep,
      cpuwidget,sep,
      fswidget,sep,
      volwidget,sep,
      layout = awful.widget.layout.horizontal.leftright
    },
    batwidget,sep,
    layout = awful.widget.layout.horizontal.rightleft
  }
end





-------- Mouse bindings --------
root.buttons(awful.util.table.join(
  awful.button({ }, 3, function () mymainmenu:toggle() end),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
))




--------- Key bindings --------
globalkeys = awful.util.table.join(
  awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
  awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
  awful.key({ modkey,           }, "h",   awful.tag.viewprev       ),
  awful.key({ modkey,           }, "i",  awful.tag.viewnext       ),
  awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

  awful.key({ modkey,           }, "n",
    function ()
      awful.client.focus.byidx( 1)
      if client.focus then client.focus:raise() end
    end
  ),
  awful.key({ modkey,           }, "e",
    function ()
      awful.client.focus.byidx(-1)
      if client.focus then client.focus:raise() end
    end
  ),

  awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),
  awful.key({ modkey, "Shift"   }, "n", function () awful.client.swap.byidx(  1)    end),
  awful.key({ modkey, "Shift"   }, "e", function () awful.client.swap.byidx( -1)    end),
  awful.key({ modkey, "Control" }, "n", function () awful.screen.focus_relative( 1) end),
  awful.key({ modkey, "Control" }, "e", function () awful.screen.focus_relative(-1) end),
  --awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
  awful.key({ modkey,           }, "Tab",
    function ()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end
  ),

  awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
  awful.key({                   }, "XF86AudioRaiseVolume",function () awful.util.spawn("amixer -c 0 set Master playback 5%+") end),
  awful.key({                   }, "XF86AudioLowerVolume",function () awful.util.spawn("amixer -c 0 set Master playback 5%-") end),
  awful.key({                   }, "XF86AudioMute",function () awful.util.spawn("amixer -c 0 set Master playback 0") end),
  awful.key({                   }, "XF86WWW", function() awful.util.spawn(browser) end      ),
  awful.key({ modkey,           }, "b", function() awful.util.spawn(browser) end      ),
  awful.key({ modkey,           }, "o", function () awful.util.spawn(applauncher) end),
  awful.key({ modkey, "Control" }, "r", awesome.restart),
  awful.key({ modkey, "Shift"   }, "q", awesome.quit),

  --awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
  --awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
  --awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
  --awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
  --awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
  --awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
  awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
  awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

  -- Prompt
  awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

  awful.key({ modkey }, "x",
    function ()
      awful.prompt.run({ prompt = "Run Lua code: " },
        mypromptbox[mouse.screen].widget,
        awful.util.eval, nil,
        awful.util.getdir("cache") .. "/history_eval"
      )
    end
  )
)

clientkeys = awful.util.table.join(
  awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
  awful.key({ modkey, "Shift"   }, "Return",      function (c) c:kill()                         end),
  --awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
  awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
  awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
  awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
  awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
  --awful.key({ modkey,           }, "n",      function (c) c.minimized = not c.minimized    end),
  awful.key({ modkey,           }, "m",
    function (c)
      c.maximized_horizontal = not c.maximized_horizontal
      c.maximized_vertical   = not c.maximized_vertical
    end
  )
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
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
          awful.client.movetotag(tags[client.focus.screen][i])
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

clientbuttons = awful.util.table.join(
  awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
  awful.button({ modkey }, 1, awful.mouse.client.move),
  awful.button({ modkey }, 3, awful.mouse.client.resize))

root.keys(globalkeys)

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     size_hints_honor = false,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
