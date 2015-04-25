mytasklist = {}
mytasklist.buttons = awful.util.table.join(
  awful.button({ }, 1, 
    function (c)
      if not c:isvisible() then
        awful.tag.viewonly(c:tags()[1])
      end
      client.focus = c
      c:raise()
    end
  ),
  awful.button({ }, 3,
    function ()
      if instance then
        instance:hide()
        instance = nil
      else
        instance = awful.menu.clients({ width=250 })
      end
    end
  ),
  awful.button({ }, 4, 
    function ()
     awful.client.focus.byidx(1)
      if client.focus then client.focus:raise() end
    end
  ),
  awful.button({ }, 5, 
    function ()
      awful.client.focus.byidx(-1)
      if client.focus then client.focus:raise() end
    end
  )
)

for s = 1, screen.count() do
  mytasklist[s] = awful.widget.tasklist(
    function(c)
      return awful.widget.tasklist.label.currenttags(c, s, {bg_focus="#111111"})
    end, 
    mytasklist.buttons
  )
end

