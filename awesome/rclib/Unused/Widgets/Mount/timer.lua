mountTimer = timer({ timeout = 3 })
mountTimer:connect_signal("timeout", function() mountUpdateFunction(mountInfo) end)
mountTimer:start()
