birthdayTimer = timer({timeout = 1001})
birthdayTimer:connect_signal("timeout", setBirthdayWidgets)
birthdayTimer:start()
