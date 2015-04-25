taglistVertical = {}
taglistVertical.buttons = awful.util.table.join(
  awful.button({ }, 1, awful.tag.viewonly),
  awful.button({ modkey }, 1, awful.client.movetotag),
  awful.button({ }, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, awful.client.toggletag),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
)

for s = 1, screen.count() do
  --taglistVertical[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglistVertical.buttons)
  taglistVertical[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglistVertical.buttons, {disable_icon = true}, myCommon.list_update, wibox.layout.fixed.vertical() )
end
