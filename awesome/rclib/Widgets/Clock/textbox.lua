clockTextbox = wibox.widget.textbox()
clockTextbox:set_align("center")
clockTextbox:set_font("8")

clockWidget = wibox.widget.background()
clockWidget:set_widget(clockTextbox)
clockWidget:set_bg(clockColor.bg)
clockWidget:set_fg(clockColor.fg)

vicious.register(clockTextbox, vicious.widgets.date, "%A\n<span font='20'>%H:%M</span>\n%e. %B\n%Y", 59)
