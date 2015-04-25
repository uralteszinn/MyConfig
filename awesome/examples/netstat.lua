--calculate all we need
upstream = 0
downstream = 0
prevUp = 0
prevDown = 0

netSpeed = function()
  --Get values
  rx = awful.util.pread("cat /sys/class/net/wlan0/statistics/rx_bytes")
  tx = awful.util.pread("cat /sys/class/net/wlan0/statistics/tx_bytes")
  --calculate

  upstream = tx-prevUp
  downstream = rx-prevDown
  prevUp = tx
  prevDown = rx

  upSpedColor   = beautiful.fg_widgets
  downSpedColor = beautiful.fg_widgets

  if upstream > 200000 then upSpedColor   = beautiful.titlebar_fg_focus end
  if downstream > 200000 then downSpedColor = beautiful.titlebar_fg_focus end

  if upstream > 1000000 then upSpedColor   = beautiful.bg_urgent end
  if downstream > 1000000 then downSpedColor = beautiful.bg_urgent end

  netstat:set_markup("<span color='" .. upSpedColor .. "'>Up: " .. math.floor(upstream/1024) .. "kB/s</span> -- <span color='" .. downSpedColor .. "'>Down: " .. math.floor(downstream/1024) .. "kB/s</span>")
end

--create the widget

netstat = wibox.widget.textbox()

netTimer = timer({timeout = 1})
netTimer:connect_signal("timeout", netSpeed)
netTimer:start()
