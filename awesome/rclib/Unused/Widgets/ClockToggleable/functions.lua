showClock = function()
  for s=1, screen.count() do
    wiboxPositioning(clockWibox[s], s, 100, 100, "right", "bottom", "w")
    clockWibox[s].x = clockWibox[s].x - clockOffset
    clockWibox[s].y = clockWibox[s].y - clockOffset
  end
  if clockTimer.started then
    clockTimer:stop()
  end
  clockTimer:start()
  clockWibox[mouse.screen].visible = true
end

removeClock = function()
  clockTimer:stop()
  for s=1,screen.count() do
    clockWibox[s].visible = false
  end
end
