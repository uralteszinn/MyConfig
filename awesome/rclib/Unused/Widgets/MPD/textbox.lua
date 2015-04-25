mpdWidgetText = wibox.widget.textbox()
mpdWidgetText:set_align("center")
mpdWidgetText:set_valign("center")

mpdWidget = wibox.widget.background()
mpdWidget:set_widget(mpdWidgetText)

vicious.register(mpdWidgetText, vicious.widgets.mpd, mpdFunction, 3)
