createMountTextboxes = function(entries)
  local tbs = {}

  tbs.textbox    = wibox.widget.textbox()
  tbs.textbox:set_markup("<span weight='bold' font='12' color='" .. mountColor.fg_title .. "'>Mounting</span>")

  tbs.background = wibox.widget.background()
  tbs.background:set_widget(tbs.textbox)

  for i=1, #entries do
    tbs[i] = {}

    tbs[i].textbox    = wibox.widget.textbox()
    tbs[i].textbox:set_font("Bitstream Vera Sans Mono, 8")
    tbs[i].textbox:set_valign("top")
    tbs[i].textbox:set_markup("Setting up...")

    tbs[i].background = wibox.widget.background()
    tbs[i].background:set_widget(tbs[i].textbox)
  end

  return tbs
end
