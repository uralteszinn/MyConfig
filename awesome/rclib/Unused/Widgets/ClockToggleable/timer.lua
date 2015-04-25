clockTimer = timer({timeout = clockTimeout})
clockTimer:connect_signal("timeout", removeClock)
