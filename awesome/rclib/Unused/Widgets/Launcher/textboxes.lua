launcherTextboxes = function(title, launchText, launchPrgs)

  local textboxes = {}
  local backgrounds = {}

  local titleTextbox = wibox.widget.textbox()
  titleTextbox:set_markup("<b>" .. title .. "</b>\n")
  titleTextbox:set_align("center")

  local titleBackground = wibox.widget.background()
  titleBackground:set_widget(titleTextbox)
  titleBackground:set_bg(launcherColor.title_bg)
  titleBackground:set_fg(launcherColor.title_fg)

  for s=1, screen.count() do
    textboxes[s] = {}
    backgrounds[s] = {}

    for i, prg in ipairs(launchPrgs) do
      textboxes[s][i] = wibox.widget.textbox()
      textboxes[s][i]:set_text(launchText[i])
      textboxes[s][i]:set_align("center")

      backgrounds[s][i] = wibox.widget.background()
      backgrounds[s][i]:set_widget(textboxes[s][i])
      backgrounds[s][i]:set_bg(launcherColor.bg)
      backgrounds[s][i]:set_fg(launcherColor.fg)

      backgrounds[s][i]:connect_signal("mouse::enter", function() backgrounds[s][i]:set_bg(launcherColor.bg_focus) end)
      backgrounds[s][i]:connect_signal("mouse::leave", function() backgrounds[s][i]:set_bg(launcherColor.bg)       end)
      backgrounds[s][i]:buttons(awful.util.table.join(
        awful.button({ }, 1, function () 
          if type(prg) == "string" then
            awful.util.spawn(prg) 
          elseif type(prg) == "function" then
            prg()
          else
            naughty.notify({ 
                            screen    = s,
                            title     = "Error", 
                            text      = "No action has been assigned!",
                            preset    = naughty.config.presets.critical,
                           })
          end
        end)
      ))
    end
  end

  local res     = {}
  res.textboxes = backgrounds
  res.title     = titleBackground

  return res
end
