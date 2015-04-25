getBatIDs = function()
  local ids = {}
  local idsText = awful.util.pread('ls /sys/class/power_supply | grep BAT')
  for line in string.gmatch(idsText, "[^\n]+") do
    table.insert(ids, line)
  end
  return ids
end

batFunction = function(widget, args)
  state  = args[1]
  amount = args[2]
  time   = args[3]

  if state == "+" or state == "↯" then
    state = "Charging"
    color = batColor.charging
  elseif state == "⌁" then
    state = "Unknown"
    color = batColor.unknown
  elseif tonumber(amount) > 20 then
    state = "Discharging"
    color = batColor.discharging
  else
    state = "Urgent"
    color = batColor.urgent
  end

  widget:set_color(color)

  return amount
end

addBat = function(id)
    batteries[id] = {}

    batteries[id].textbox = wibox.widget.textbox()
    batteries[id].textbox:set_font('8')
    batteries[id].textbox:set_markup("<span color='#ffa500'>" .. id .. "</span>")

    batteries[id].progressbar = awful.widget.progressbar()

    vicious.register(batteries[id].progressbar, vicious.widgets.bat, batFunction, 3, id)
end

removeBat = function(id)
    vicious.unregister(batteries[id].progressbar)
    batteries[id] = nil
end

updateBatWibox = function()
  batLayout:reset()
  local ids = getBatIDs()
  for _, id in ipairs(ids) do
      if batteries[id] then
          batLayout:add(batteries[id].textbox)
          batLayout:add(batteries[id].progressbar)
          batLayout:add(batSpaceTextbox)
      end
  end
end

equalValues = function(t1,t2)
    equal = true
    for _,v in ipairs(t1) do
        if not awful.util.table.hasitem(t2,v) then
            equal = false
        end
    end
    for _,v in ipairs(t2) do
        if not awful.util.table.hasitem(t1,v) then
            equal = false
        end
    end
    return equal
end

checkBat = function()
    currentBatIDs = getBatIDs()

    if not equalValues(currentBatIDs,previousBatIDs) then
        for _,id in ipairs(previousBatIDs) do
            removeBat(id)
        end

        for _,id in ipairs(currentBatIDs) do
            addBat(id)
        end
        updateBatWibox()

        previousBatIDs = awful.util.table.clone(currentBatIDs)
    end
end

