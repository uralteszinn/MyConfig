launcherWidget = function(title, launchText, launchPrgs, position)
  local launcherWibox = {}
  local tmp = launcherTextboxes(title, launchText, launchPrgs)
  myTextLauncher = tmp.textboxes
  launcherTitle  = tmp.title

  for s = 1, screen.count() do
    launcherWibox[s]              = wibox({})
    launcherWibox[s].width        = 150
    launcherWibox[s].height       = (#(launchPrgs)+1) * 20
    launcherWibox[s].visible      = false
    launcherWibox[s].ontop        = true

    launcherWibox[s].x = screen[s].geometry.x - launcherWibox[s].border_width + position*(screen[s].geometry.width-launcherWibox[s].width-launcherWibox[s].border_width)
    launcherWibox[s].y = screen[s].geometry.y + screen[s].geometry.height - launcherWibox[s].height - launcherWibox[s].border_width

    local layout = wibox.layout.flex.vertical()
    layout:add(launcherTitle)
    for _, launcher in ipairs(myTextLauncher[s]) do
      layout:add(launcher)
    end
    launcherWibox[s]:set_widget(layout)
    
    launcherWibox[s]:connect_signal("mouse::leave", function() launcherWibox[s].visible = false end)
  end

  launcherTitleWibox = {}

  for s = 1, screen.count() do
    launcherTitleWibox[s]              = wibox({})
    launcherTitleWibox[s].width        = 150
    launcherTitleWibox[s].height       = 20
    launcherTitleWibox[s].visible      = true

    launcherTitleWibox[s].x = screen[s].geometry.x - launcherTitleWibox[s].border_width + position*(screen[s].geometry.width-launcherTitleWibox[s].width-launcherTitleWibox[s].border_width)
    launcherTitleWibox[s].y = screen[s].geometry.y + screen[s].geometry.height - launcherTitleWibox[s].height - launcherTitleWibox[s].border_width

    local layout = wibox.layout.flex.vertical()
    layout:add(launcherTitle)
    launcherTitleWibox[s]:set_widget(layout)

    launcherTitleWibox[s]:connect_signal("mouse::enter", function() launcherWibox[s].visible=true end)
  end

  local res    = {}
  res.title    = launcherTitleWibox
  res.launcher = launcherWibox

  return res
end
