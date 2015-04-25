for s = 1, screen.count() do
  for _, t in pairs(awful.tag.gettags(s)) do
    t:connect_signal("property::layout", function(tag) showLayoutbox() end)
  end
end
