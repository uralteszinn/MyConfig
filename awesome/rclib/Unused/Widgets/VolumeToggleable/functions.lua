showVol = function()
  if volTimer.started then
    volTimer:stop()
  end
  volTimer:start()
  volTextboxWibox[mouse.screen].ontop = true
  for s=1,screen.count() do
    volTextboxWibox[s].visible = true
  end
  volPBWibox[mouse.screen].ontop      = true
end

removeVol = function()
  volTimer:stop()
  for s=1,screen.count() do
    volTextboxWibox[s].visible = false
    volTextboxWibox[s].ontop   = false
    volPBWibox[s].ontop        = false
  end
end

raiseVol = function()
  awful.util.spawn("amixer set Master playback 5%+")
  vicious.force({volText,volPB})
  showVol()
end

lowerVol = function()
  awful.util.spawn("amixer set Master playback 5%-")
  vicious.force({volText,volPB})
  showVol()
end

toggleVol = function()
  awful.util.spawn("amixer set Master playback toggle") 
  vicious.force({volText,volPB})
  showVol()
end

leftButtonVol = function()
  toggleVol()
end

rightButtonVol = function()
  awful.util.spawn("amixer set Master playback mute")
  awful.util.spawn("amixer set Master playback 0%")
  vicious.force({volText,volPB})
  showVol()
end
