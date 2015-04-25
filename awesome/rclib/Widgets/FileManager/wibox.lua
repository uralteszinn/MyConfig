for i=1,3 do
    fileManager[i].wibox = wibox({})
    fileManager[i].wibox.height = fileManager.height.wibox
    fileManager[i].wibox.width = fileManager.width.wibox
    fileManager[i].wibox.visible = true

    fileManager[i].layout = {}
    fileManager[i].layout.grid = {}
    fileManager[i].layout.grid.layout = wibox.layout.fixed.vertical()
    for j = 1, fileManager.numberOfEntries do
       fileManager[i].layout.grid.layout:add(fileManager[i].textbox.margin.background[j])
    end

    fileManager[i].layout.margin = {}
    fileManager[i].layout.margin.layout = wibox.layout.margin()
    fileManager[i].layout.margin.layout:set_margins(fileManager.height.wiboxMargin)
    fileManager[i].layout.margin.layout:set_widget(fileManager[i].layout.grid.layout)

    fileManager[i].layout.margin.background = wibox.widget.background()
    fileManager[i].layout.margin.background:set_bg(fileManager.color.wibox.normal)
    fileManager[i].layout.margin.background:set_widget(fileManager[i].layout.margin.layout)

    fileManager[i].wibox:set_widget(fileManager[i].layout.margin.background)
end


wiboxPositioning(fileManager[1].wibox , 1, 25, 50)
wiboxPositioning(fileManager[2].wibox  , 1, 50, 50)
wiboxPositioning(fileManager[3].wibox, 1, 75, 50)
--wiboxPositioning(fileManager.info.wibox     , 1, 75, 50)
--fileManager.info.wibox.visible = false
