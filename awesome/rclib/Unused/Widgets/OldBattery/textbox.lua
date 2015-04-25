batTextbox = wibox.widget.textbox()
batTextbox:set_markup("Setting up ...")
batTextbox:set_font("Bitstream Vera Sans Mono, 8")
batTextbox:set_valign("bottom")

batWidget = wibox.widget.background()
batWidget:set_widget(batTextbox)
