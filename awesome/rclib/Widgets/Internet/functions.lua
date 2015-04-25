getInterfaces = function()
  local interfaces = {}

  interfacesText = awful.util.pread("ifconfig -a -s | awk '{print $1}' | tail -n +2")
  for line in string.gmatch(interfacesText, "[^\n]+") do
    if line ~= "lo" then
      table.insert(interfaces, line)
    end
  end
  return interfaces
end

-- interface: string containing interface
getInternalIP = function(interface)
    local ip = awful.util.pread("ip -4 -o addr | grep " .. interface .. " | awk '{print $4}' | awk -F/ '{print $1}'")
    local ip = string.sub(ip,1,string.len(ip)-1)
    return ip
end

-- interfaces: table of strings containing interfaces
getInternalIPs = function(interfaces)
  local ips = {}

  for _, interface in ipairs(interfaces) do
    local ip = getInternalIP(interface) 
    if ip ~= "" then
      ips[interface] = ip
    end
  end

  return ips
end

internetFunction = function()
  haveInternet = false

  local ips = getInternalIPs(interfaces)

  if countAll(ips) > 0 then
    haveInternet = true
  end
  
  local internetText = "<span font='20'>INET</span>\n"

  if haveInternet then 
    internetWidget:set_fg(internetColor.fg)
    internetText = internetText .. "available"

    if not hadInternet then
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
    end
  else
    internetWidget:set_fg(internetColor.fg_urgent)
    internetText = internetText .. "unavailable"
    if hadInternet then
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
    end
  end
  internetTextbox:set_markup(internetText)
end


