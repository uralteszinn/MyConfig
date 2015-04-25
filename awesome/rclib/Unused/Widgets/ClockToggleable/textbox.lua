clockText = wibox.widget.textbox()
clockText:set_align("center")
clockText:set_font("27")

clockTextbox = wibox.widget.background()
clockTextbox:set_widget(clockText)
clockTextbox:set_bg(clockColor.bg)
clockTextbox:set_fg(clockColor.fg)

vicious.register(clockText, vicious.widgets.date, "%A, %H:%M\n<span font='18'>%e. %B %Y</span>", 59)


clockText:buttons(awful.util.table.join(
  awful.button({}, 1, removeClock)
))
