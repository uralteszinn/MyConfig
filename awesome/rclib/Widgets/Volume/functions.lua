configVolume = function()
  awful.util.spawn("amixer set Center playback 100%")
  awful.util.spawn("amixer set Center playback unmute")
  awful.util.spawn("amixer set Side playback 100%")
  awful.util.spawn("amixer set Side playback unmute")
end

raiseVol = function()
  configVolume()
  awful.util.spawn("amixer set Master playback 5%+")
  vicious.force({volTextbox})
end

lowerVol = function()
  configVolume()
  awful.util.spawn("amixer set Master playback 5%-")
  vicious.force({volTextbox})
end

toggleVol = function()
  configVolume()
  awful.util.spawn("amixer set Master playback toggle") 
  vicious.force({volTextbox})
end

leftButtonVol = function()
  toggleVol()
end

rightButtonVol = function()
  configVolume()
  awful.util.spawn("amixer set Master playback mute")
  awful.util.spawn("amixer set Master playback 0%")
  vicious.force({volTextbox})
end
