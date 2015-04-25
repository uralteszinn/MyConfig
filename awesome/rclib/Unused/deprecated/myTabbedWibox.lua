myTabbedWibox = {}

for s = 1, screen.count() do
  myTabbedWibox[s] = wibox({screen = 1})
  myTabbedWibox[s].visible = true
  myTabbedWibox[s]:set_bg("#ff0000")
  myTabbedWibox[s]:geometry({x = 0, y = beautiful.topWiboxHeight, height = 10, width = screen[s].workarea.width})
end
