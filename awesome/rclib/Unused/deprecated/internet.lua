interfaces = {}

interfacesText = awful.util.pread("ifconfig -a -s | awk '{print $1}' | tail -n +2")
for line in string.gmatch(interfacesText, "[^\n]+") do
  if line ~= "lo" then
    table.insert(interfaces, line)
  end
end

internetWidgetText = wibox.widget.textbox()
internetWidgetText:set_markup(" Setting up... ")

internetWidget = wibox.widget.background()
internetWidget:set_widget(internetWidgetText)

haveInternet = false
hadInternet  = false

extIP = nil

internetTTText = ""
internetTTIcon = ico_path .. "internetGray.png"

internetFunction = function()
  local ips = {}
  haveInternet = false

  for _, interface in ipairs(interfaces) do
    local ip = awful.util.pread("ip -4 -o addr | grep " .. interface .. " | awk '{print $4}' | awk -F/ '{print $1}'")
    local ip = string.sub(ip,1,string.len(ip)-1)
    if ip ~= "" then
      ips[interface] = ip
      haveInternet = true
    end
  end
  
  if haveInternet then 
    internetWidget:set_bg()
    internetWidgetText:set_markup(" <span color='" .. beautiful.widgetFGGood .. "'>Internet</span> ")
    internetTTIcon = ico_path .. "internet.png"
    internetTTText = "Internet Connection established\n\n<b>Internal IPs</b>"
    for _, interface in ipairs(interfaces) do
      if ips[interface] then
        internetTTText = internetTTText .. "\n" .. interface .. ": " .. tostring(ips[interface])
      end
    end

    if not hadInternet then
      extIP = awful.util.pread("lynx --dump http://ipecho.net/plain")
      extIP = string.gsub(extIP,"%s","")
      for s=1, screen.count() do
      naughty.notify({
                       screen    = s,
                       title     = "Internet",
                       text      = "Internet Connection established",
                       icon      = ico_path .. "internet.png",
                       icon_size = 30,
                       preset    = naughty.config.presets.normal,
                    })
      end
      hadInternet = true
      startProg("dropboxd","")
    end
    if extIP then
      if string.find(extIP, "%d+%.%d+%.%d+%.%d+") then
        internetTTText = internetTTText .. "\n\n<b>External IP</b>\n" .. extIP
      else
        internetTTText = internetTTText .. "\n\n<b>External IP</b>\nProblem getting external IP"
      end
    end
  else
    internetWidget:set_bg(beautiful.widgetBGUrgent)
    internetWidgetText:set_markup(" <span color='" .. beautiful.widgetFGUrgent .. "'>Internet</span> ")
    internetTTIcon = ico_path .. "internetGray.png"
    internetTTText = "No Internet Connection"
    if hadInternet then
      extIP = nil
      for s=1, screen.count() do
      naughty.notify({
                       screen    = s,
                       title     = "Internet",
                       text      = "No Internet Connection",
                       icon      = ico_path .. "internetGray.png",
                       icon_size = 30,
                       preset    = naughty.config.presets.critical,
                    })
      end
      hadInternet = false
      stopProg("dropbox")
    end
  end

end

internetFunction()

internetTimer = timer({ timeout = 2 })
internetTimer:connect_signal("timeout", internetFunction)
internetTimer:start()

-- Tooltip
internetTT = nil
showInternetTT = function()
  internetTT = naughty.notify({ 
                          screen    = mouse.screen,
                          title     = "Internet",
                          text      = internetTTText,
                          icon      = internetTTIcon,
                          icon_size = 25,
                          preset    = naughty.config.presets.tooltip,
                        })
end
deleteInternetTT = function()
  naughty.destroy(internetTT)
end

internetWidgetText:connect_signal("mouse::enter", showInternetTT)
internetWidgetText:connect_signal("mouse::leave", deleteInternetTT)

internetWidgetText:buttons(awful.util.table.join(
  awful.button({ },1, function() 
      hadInternet = not hadInternet
    end)
))
