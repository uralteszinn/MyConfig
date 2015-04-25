batRemindTimer = timer({timeout = 60})
batRemindTimer:connect_signal("timeout", batRemind)

checkBatTimer = timer({timeout = 7})
checkBatTimer:connect_signal("timeout", checkBat)
checkBatTimer:start()
