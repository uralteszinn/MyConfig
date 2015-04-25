mpdFunction = function(widget, args)
  local state = args["{state}"]
  local res = ""

  if state == "Play" then
    if wiboxesVisible == false then
      for s = 1, screen.count() do
        myMPDWibox[s].visible = true
      end
      wiboxesVisible = true
    end
    local tmp = {}
    tmp.title = args["{Title}"]
    tmp.artist = args["{Artist}"]
    tmp.album = args["{Album}"]
    tmp.genre = args["{Genre}"]
    
    res = "<span font='14'>" .. tmp.title .. "</span>\n\n<span color='white' font='7'><b>Artist</b></span> " .. tmp.artist .. " <span color='white' font='7'><b>Album</b></span> " .. tmp.album .. " <span color='white' font='7'><b>Genre</b></span> " .. tmp.genre
  else -- state is "Pause", "Stop" or "N/A"
    if wiboxesVisible == true then
      for s = 1, screen.count() do
        myMPDWibox[s].visible = false
      end
      wiboxesVisible = false
    end
  end

  return res
end

mpdToggle = function()
  awful.util.spawn("mpc toggle")
  vicious.force({mpdWidgetText})
end

mpdNext = function()
  awful.util.spawn("mpc next")
  vicious.force({mpdWidgetText})
end

mpdPrev = function()
  awful.util.spawn("mpc prev")
  vicious.force({mpdWidgetText})
end

mpdForwardStep = function()
  awful.util.spawn("mpc seek +5")
  vicious.force({mpdWidgetText})
end

mpdBackwardStep = function()
  awful.util.spawn("mpc seek -5")
  vicious.force({mpdWidgetText})
end

mpdForwardLeap = function()
  awful.util.spawn("mpc seek +1:00")
  vicious.force({mpdWidgetText})
end

mpdBackwardLeap = function()
  awful.util.spawn("mpc seek -1:00")
  vicious.force({mpdWidgetText})
end
