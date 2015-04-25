client.connect_signal("focus", updateWindowsTitle)
client.connect_signal("property::icon", updateWindowsTitleIcon)
client.connect_signal("property::name", updateWindowsTitleText)
client.connect_signal("unfocus", clearWindowsTitle)
