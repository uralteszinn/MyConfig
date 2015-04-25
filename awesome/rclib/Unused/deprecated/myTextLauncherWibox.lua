myTextLauncherWibox = {}

for s = 1, screen.count() do
  --launchIconSize = math.min(150,math.floor(screen[s].geometry.width/(2*#(launchPrgs))))
  myTextLauncherWibox[s]              = wibox({})
  myTextLauncherWibox[s]:set_bg(beautiful.launcherWiboxBG)
  myTextLauncherWibox[s]:set_fg(beautiful.launcherWiboxFG)
  myTextLauncherWibox[s].width        = 150
  myTextLauncherWibox[s].height       = (#(launchPrgs)+1) * 20
  myTextLauncherWibox[s].visible      = false
  myTextLauncherWibox[s].border_width = 0
  myTextLauncherWibox[s].border_color = "#888888"

  myTextLauncherWibox[s].x = screen[s].geometry.x
  myTextLauncherWibox[s].y = screen[s].geometry.y
  awful.placement.centered(myTextLauncherWibox[s])
  myTextLauncherWibox[s].x = myTextLauncherWibox[s].x - myTextLauncherWibox[s].border_width
  myTextLauncherWibox[s].y = myTextLauncherWibox[s].y - myTextLauncherWibox[s].border_width
  myTextLauncherWibox[s].y = screen[s].geometry.y + screen[s].geometry.height - myTextLauncherWibox[s].height - myTextLauncherWibox[s].border_width

  if s==1 then
    dofile(wgt_path .. "textLauncher.lua")
  end 

  myTextLauncherLayout_left = wibox.layout.flex.vertical()
  myTextLauncherLayout_left:add(myTextLauncherTitle)
  for _, launcher in ipairs(myTextLauncher[s]) do
    myTextLauncherLayout_left:add(launcher)
  end

  myTextLauncherLayout = wibox.layout.align.vertical()
  myTextLauncherLayout:set_middle(myTextLauncherLayout_left)
  
  myTextLauncherWibox[s]:set_widget(myTextLauncherLayout)
  
  myTextLauncherWibox[s]:connect_signal("mouse::leave", function() myTextLauncherWibox[s].visible = false end)
end

myTextLauncherWiboxTitle = {}

for s = 1, screen.count() do
  --launchIconSize = math.min(150,math.floor(screen[s].geometry.width/(2*#(launchPrgs))))
  myTextLauncherWiboxTitle[s]              = wibox({})
  myTextLauncherWiboxTitle[s]:set_bg(beautiful.launcherWiboxBG)
  myTextLauncherWiboxTitle[s]:set_fg(beautiful.launcherWiboxFG)
  myTextLauncherWiboxTitle[s].width        = 150
  myTextLauncherWiboxTitle[s].height       = 20
  myTextLauncherWiboxTitle[s].visible      = true
  myTextLauncherWiboxTitle[s].border_width = 0
  myTextLauncherWiboxTitle[s].border_color = "#888888"

  myTextLauncherWiboxTitle[s].x = screen[s].geometry.x
  myTextLauncherWiboxTitle[s].y = screen[s].geometry.y
  awful.placement.centered(myTextLauncherWiboxTitle[s])
  myTextLauncherWiboxTitle[s].x = myTextLauncherWiboxTitle[s].x - myTextLauncherWiboxTitle[s].border_width
  myTextLauncherWiboxTitle[s].y = myTextLauncherWiboxTitle[s].y - myTextLauncherWiboxTitle[s].border_width
  myTextLauncherWiboxTitle[s].y = screen[s].geometry.y + screen[s].geometry.height - myTextLauncherWiboxTitle[s].height - myTextLauncherWiboxTitle[s].border_width

  myTextLauncherLayout_left = wibox.layout.flex.vertical()
  myTextLauncherLayout_left:add(myTextLauncherTitle)

  myTextLauncherLayout = wibox.layout.align.vertical()
  myTextLauncherLayout:set_middle(myTextLauncherLayout_left)
  
  myTextLauncherWiboxTitle[s]:set_widget(myTextLauncherLayout)

  myTextLauncherWiboxTitle[s]:connect_signal("mouse::enter", function() myTextLauncherWibox[s].visible=true end)
end
