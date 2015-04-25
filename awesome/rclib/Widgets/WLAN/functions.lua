getWirelessInterface = function()
  local wirelessInterfaceText = awful.util.pread("iwconfig")
  local wirelessInterface = nil

  for line in string.gmatch(wirelessInterfaceText, "[^\n]+") do
    if string.find(line, "^%w") then
      if not string.find(line, "no wireless extensions") then
        wirelessInterface = string.match(line, "^%w+") 
      end
    end
  end

  return wirelessInterface
end
