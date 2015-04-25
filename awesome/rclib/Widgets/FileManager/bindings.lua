for i = 1,3 do
    for j = 1,fileManager.numberOfEntries do
        fileManager[i].textbox.margin.background[j]:buttons(awful.util.table.join(
          awful.button({}, 1, function() fileManager.functions.entry.click(i,j) end)
        --awful.button({}, 3, function() fileManager.functions.entry.scrollDown(i) end)
          --,awful.button({"Ctrl"}, 1, function() fileManager.functions.entry.selectToggle(2,j) end)
        ))
    end
    fileManager[i].wibox:buttons(awful.util.table.join( 
        awful.button({}, 5, function() fileManager.functions.entry.scrollDown(i) end),
        awful.button({}, 4, function() fileManager.functions.entry.scrollUp(i) end)
    ))
end
