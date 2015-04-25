for i=1,3 do
    fileManager[i].textbox = {}
    fileManager[i].textbox.margin = {}

    fileManager[i].textbox.widget = {}
    fileManager[i].textbox.background = {}
    fileManager[i].textbox.constraint = {}
    fileManager[i].textbox.margin.layout = {}
    fileManager[i].textbox.margin.background = {}

    for j = 1, fileManager.numberOfEntries do
        fileManager[i].textbox.widget[j] = wibox.widget.textbox()
        fileManager[i].textbox.widget[j]:set_markup("Setting up")
        fileManager[i].textbox.widget[j]:set_font(fileManager.font)
        
        fileManager[i].textbox.constraint[j] = wibox.layout.constraint()
        fileManager[i].textbox.constraint[j]:set_strategy('exact')
        fileManager[i].textbox.constraint[j]:set_height(fileManager.height.textbox)
        fileManager[i].textbox.constraint[j]:set_widget(fileManager[i].textbox.widget[j])

        fileManager[i].textbox.background[j] = wibox.widget.background()
        fileManager[i].textbox.background[j]:set_fg(fileManager.color.textbox.fg_normal)
        fileManager[i].textbox.background[j]:set_widget(fileManager[i].textbox.constraint[j])

        fileManager[i].textbox.margin.layout[j] = wibox.layout.margin()
        fileManager[i].textbox.margin.layout[j]:set_margins(fileManager.height.textboxMargin)
        fileManager[i].textbox.margin.layout[j]:set_widget(fileManager[i].textbox.background[j])

        fileManager[i].textbox.margin.background[j] = wibox.widget.background()
        fileManager[i].textbox.margin.background[j]:set_bg(fileManager.color.textbox.bg_normal)
        fileManager[i].textbox.margin.background[j]:set_widget(fileManager[i].textbox.margin.layout[j])
    end
end
