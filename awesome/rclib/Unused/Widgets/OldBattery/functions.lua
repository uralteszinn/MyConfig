getBatID = function()
  local id = awful.util.pread('ls /sys/class/power_supply | grep BAT | head -n 1')
  id = string.sub(id,1,string.len(id)-1)
  if id == "" then id = awesomeSettings.batteryID end
  return id
end

batRemind = function()
  for s=1, screen.count() do
    naughty.notify({ 
                    screen    = s,
                    title     = "Battery", 
                    text      = batRemindTimerText,
                    icon      = batIcon,
                    icon_size = 36,
                    preset    = naughty.config.presets.critical,
                   })
  end
end

batFunction = function(widget, args)
  state  = args[1]
  amount = args[2]
  time   = args[3]

  if state == "+" or state == "↯" then
    state = "Charging"
    color = batColor.charging
    if batRemindTimer.started then
      batRemindTimer:stop()
    end
  elseif state == "⌁" then
    state = "Unknown"
    color = batColor.unknown
    if batRemindTimer.started then
      batRemindTimer:stop()
    end
  elseif tonumber(amount) > 20 then
    state = "Discharging"
    color = batColor.discharging
    if batRemindTimer.started then
      batRemindTimer:stop()
    end
  else
    state = "Urgent"
    color = batColor.urgent
    if not batRemindTimer.started then
      batRemindTimer:start()
    end
  end

  widget:set_color(color)

  local batText = "<span weight='bold' font='12' color='" .. color .. "'>Battery</span>\n\n" ..
                  "<b>State</b>\t" .. state .. "\n" ..
                  "<b>Amount</b>\t" .. amount .. "%\n" .. 
                  "<b>Time</b>\t" .. time .. "\n"
  batTextbox:set_markup(batText)

  batRemindTimerText = amount .. "% (" .. time .. ")"

  return amount
end

toggleBat = function ()
  if batPBWibox.visible then
    vicious.unregister(batPB, true)
    batRemindTimer:stop()
  else
    vicious.activate(batPB)
  end
  batPBWibox.visible = not batPBWibox.visible
  batWibox.visible = not batWibox.visible
end

hideBat = function ()
  batPBWibox.visible = not batPBWibox.visible
  batWibox.visible = not batWibox.visible
end

checkBat = function()
  hasBat = awful.util.pread("acpi") ~= ""
  if hadBat and (not hasBat) then
    vicious.unregister(batPB, true)
    batPBWibox.visible = false
    batWibox.visible = false
    hadBat = false
  elseif (not hadBat) and hasBat then
    vicious.activate(batPB)
    batPBWibox.visible = true
    batWibox.visible = true
    hadBat = true
  end
end
