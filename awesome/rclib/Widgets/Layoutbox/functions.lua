showLayoutbox = function()
  if layoutboxTimer.started then
    layoutboxTimer:stop()
  end
  layoutboxTimer:start()
  layoutboxWibox[mouse.screen].visible = true
end

removeLayoutbox = function()
  layoutboxTimer:stop()
  for s=1,screen.count() do
    layoutboxWibox[s].visible = false
  end
end
