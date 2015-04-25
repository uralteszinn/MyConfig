internetTimer = timer({ timeout = 2 })
internetTimer:connect_signal("timeout", internetFunction)
internetTimer:start()
