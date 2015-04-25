function createWindowsTitle()
  local res = {}

  for s=1, screen.count() do
    res[s] = {}

    res[s].textbox = wibox.widget.textbox()
    res[s].textbox:set_text("")
    res[s].textbox:set_align("center")
    res[s].textbox:set_font("Bitstream Vera Sans Mono, bold, 8")

    res[s].background = wibox.widget.background()
    res[s].background:set_widget(res[s].textbox)
    res[s].background:set_fg(windowsTitleColor.fg)

    res[s].icon = wibox.widget.imagebox()
  end

  return res
end
