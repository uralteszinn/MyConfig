runTextbox = wibox.widget.textbox()
runTextbox:set_ellipsize("start")

runWidget = wibox.widget.background()
runWidget:set_widget(runTextbox)
runWidget:set_bg(runColor.bg)
runWidget:set_fg(runColor.fg)
