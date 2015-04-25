batPB = awful.widget.progressbar()
batPB:set_vertical(true)

vicious.register(batPB, vicious.widgets.bat, batFunction, 3, batID)
