volTimer = timer({timeout = volTimeout})
volTimer:connect_signal("timeout", removeVol)
