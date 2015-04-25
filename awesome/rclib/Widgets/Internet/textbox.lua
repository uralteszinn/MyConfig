internetTextbox = wibox.widget.textbox()
internetTextbox:set_markup("Setting up ...")
internetTextbox:set_font("8")
internetTextbox:set_align("center")

internetWidget = wibox.widget.background()
internetWidget:set_widget(internetTextbox)
