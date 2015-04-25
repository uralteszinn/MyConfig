batTimerText = "Setting up..."

batPB = awful.widget.progressbar()
batPB:set_height(myBatWibox.width)
batPB:set_width(myBatWibox.height)
batPB:set_vertical(true)

batRemind = function()
  for s=1, screen.count() do
    naughty.notify({ 
                    screen    = s,
                    title     = "Battery", 
                    text      = batTimerText,
                    icon      = beautiful.batIcon,
                    icon_size = 36,
                    preset    = naughty.config.presets.critical,
                   })
  end
end

batTimer = timer({timeout = 60})
batTimer:connect_signal("timeout", batRemind)

batFunction = function(widget, args)
  state  = args[1]
  amount = args[2]
  time   = args[3]

  if state == "+" or state == "↯" then
    color = beautiful.batStateCharging
    if batTimer.started then
      batTimer:stop()
    end
  elseif state == "⌁" then
    color = beautiful.batStateUnknown
    if batTimer.started then
      batTimer:stop()
    end
  elseif tonumber(amount) > 20 then
    color = beautiful.batStateDischarging
    if batTimer.started then
      batTimer:stop()
    end
  else
    color = beautiful.batStateUrgent
    if not batTimer.started then
      batTimer:start()
    end
  end

  widget:set_color(color)

  batTTText = state .. " " .. amount .. "% (" .. time .. ")"
  batTimerText = amount .. "% (" .. time .. ")"

  return amount
end

vicious.register(batPB, vicious.widgets.bat, batFunction, 3, "BAT0")

--Tooltip
batTT = nil
showBatTT = function()
  batTT = naughty.notify({ 
                           screen    = mouse.screen,
                           title     = "Battery",
                           text      = batTTText,
                           icon      = beautiful.batIcon,
                           icon_size = 25,
                           preset    = naughty.config.presets.tooltip,
                         })
end
deleteBatTT = function()
  naughty.destroy(batTT)
end

myBatWibox:connect_signal("mouse::enter", showBatTT)
myBatWibox:connect_signal("mouse::leave", deleteBatTT)

--Keybindings
toggleBat = function ()
  if myBatWibox.visible then
    vicious.unregister(batPB, true)
    batTimer:stop()
  else
    vicious.activate(batPB)
  end
  myBatWibox.visible = not myBatWibox.visible
end

hideBat = function ()
  myBatWibox.visible = not myBatWibox.visible
end

-- Automatically toggle Battery
hadBat = true
checkBat = function()
  hasBat = awful.util.pread("acpi") ~= ""
  if hadBat and (not hasBat) then
    vicious.unregister(batPB, true)
    myBatWibox.visible = false
    hadBat = false
  elseif (not hadBat) and hasBat then
    vicious.activate(batPB)
    myBatWibox.visible = true
    hadBat = true
  end
end

checkBatTimer = timer({timeout = 7})
checkBatTimer:connect_signal("timeout", checkBat)
checkBatTimer:start()
