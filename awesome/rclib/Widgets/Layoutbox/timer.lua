layoutboxTimer = timer({timeout = layoutboxTimeout})
layoutboxTimer:connect_signal("timeout", removeLayoutbox)
