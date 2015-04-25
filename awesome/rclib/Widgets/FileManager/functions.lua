fileManager.functions = {}
fileManager.functions.path = {}
fileManager.functions.entry = {}
fileManager.functions.entries = {}
fileManager.functions.column = {}
fileManager.functions.fileManager = {}

-- ==================================================================================

--Every Path has a trailing slash!!!!
fileManager.functions.path.parent = function(path)
    if path == "/" then
        return nil
    else
        return string.gsub(path, "[^/]+/$", "")
    end
end

-- ==================================================================================

fileManager.functions.entries.initialize = function(i)
    fileManager[i].entry = {}
end

--fileManager.functions.entriesTable.numberSelected = function(i)
    --local count = 0
    --for _,entry in ipairs(fileManager[i].entry) do
        --if entry.selected then
            --count = count + 1
        --end
    --end
    --return count
--end

    

-- ==================================================================================

--fileManager.functions.entry.new = function(i,j,str)
    --fileManager[i].entry[j] = {}
    --fileManager[i].entry[j].text = str
    --fileManager[i].entry[j].selected = false
--end

fileManager.functions.entry.add = function(i,str,dir)
    local entry = {}
    entry.text = str
    entry.dir = dir
    if #fileManager[i].entry < fileManager.numberOfEntries then
        table.insert(fileManager[i].entry, entry)
    else
        naughty.notify{title = "Too Many Entries Error", text = "FileManager", preset = naughty.config.presets.critical}
    end
end

-- ==================================================================================

-- path: with trailing slash!!!
fileManager.functions.entries.populate = function(i, path)
    fileManager.functions.entries.initialize(i)
    if path then
        local first = fileManager[i].first
        local offset = fileManager.numberOfEntries-1
        local lsOutput = awful.util.pread("ls -1 \'" .. path .. "\' | awk 'NR>=" .. first .. " && NR <=" .. first+offset .. "'")
        for line in string.gmatch(lsOutput, "[^\n]+") do
            local parts = {}
            for part in string.gmatch(line, "[^ ]+") do
                table.insert(parts, part)
            end
            dir = awful.util.pread("if [ -d \'" .. path .. line .. "\' ]; then echo dir; fi") == "dir\n"
            if dir then
                fileManager.functions.entry.add(i,line,true)
            else
                fileManager.functions.entry.add(i,line,false)
            end
        end
    end
end

fileManager.functions.entries.update = function(i)
    if not i then
        for i = 1, 3 do
            fileManager.functions.entries.populate(i, fileManager[i].path)
        end
    else
        fileManager.functions.entries.populate(i, fileManager[i].path)
    end
end
-- ==================================================================================

fileManager.functions.correctCoordinate = function(i,j)
    local res = true
    if i<1 or i>3 or j<1 or j>fileManager.numberOfEntries then
        res = false
        naughty.notify{title = "Coordinate Error", text = "FileManager", preset = naughty.config.presets.critical}
    end
    return res
end

-- ==================================================================================

fileManager.functions.set_text = function(i,j,entry)
    if fileManager.functions.correctCoordinate(i,j) then
        if entry then 
            if entry.dir then
                fileManager[i].textbox.widget[j]:set_markup(entry.text  .. "  ▸")
            else
                fileManager[i].textbox.widget[j]:set_markup(entry.text)
            end
        else
            fileManager[i].textbox.widget[j]:set_markup("")
        end
    end
end

fileManager.functions.set_selection = function(i,j,selected)
    if fileManager.functions.correctCoordinate(i,j) then
        if selected then
            fileManager[i].textbox.margin.background[j]:set_bg(fileManager.color.textbox.bg_highlighted)
            fileManager[i].textbox.background[j]:set_fg(fileManager.color.textbox.fg_highlighted)
        else
            fileManager[i].textbox.margin.background[j]:set_bg(fileManager.color.textbox.bg_normal)
            fileManager[i].textbox.background[j]:set_fg(fileManager.color.textbox.fg_normal)
        end
    end
end

-- ==================================================================================

-- i: number from 1 to 3 (wibox)
fileManager.functions.column.update_text = function(i)
    for j=1, fileManager.numberOfEntries do
        fileManager.functions.set_text(i,j,fileManager[i].entry[j])
    end
end

fileManager.functions.column.update_selection = function(i)
    if i==1 then
        fileManager[1].selected = nil
        if fileManager[2].path then 
            for j = 1,fileManager.numberOfEntries do
                if fileManager[1].entry[j] and fileManager[1].path .. fileManager[1].entry[j].text .. "/" == fileManager[2].path then
                    fileManager[1].selected = j
                end
            end
        end
    end

    for j = 1,fileManager.numberOfEntries do
        fileManager.functions.set_selection(i,j,false)
    end

    if fileManager[i].selected then
        fileManager.functions.set_selection(i,fileManager[i].selected, true)
    end
end

fileManager.functions.column.update = function(i)
    fileManager.functions.column.update_text(i)
    fileManager.functions.column.update_selection(i)
end

-- ==================================================================================

fileManager.functions.fileManager.update_text = function()
    for i = 1,3 do
        fileManager.functions.column.update_text(i)
    end
end

fileManager.functions.fileManager.update_selection = function()
    for i = 1,3 do
        fileManager.functions.column.update_selection(i)
    end
end

fileManager.functions.fileManager.update = function()
    fileManager.functions.fileManager.update_text()
    fileManager.functions.fileManager.update_selection()
end

-- ==================================================================================

fileManager.functions.entry.click = function(i,j)
    if i == 1 then
        if fileManager[1].entry[j].dir then
            fileManager[3].path = fileManager[1].path .. fileManager[1].entry[j].text .. "/"
        else
            fileManager[3].path = fileManager[2].path
        end
        fileManager[2].path = fileManager[1].path
        fileManager[1].path = fileManager.functions.path.parent(fileManager[1].path)
        fileManager[3].first = fileManager[2].first
        fileManager[2].first = fileManager[1].first
        --fileManager[1].first = ??
        --fileManager[1].selected = ??
        fileManager[2].selected = j
        fileManager.functions.entries.update()
        fileManager.functions.fileManager.update()
    elseif i == 2 then
        fileManager[2].selected = j
        if fileManager[2].entry[j].dir then
            fileManager[3].path = fileManager[2].path .. fileManager[2].entry[j].text .. "/"
            fileManager[3].first = 1
            fileManager.functions.entries.update(3)
            fileManager.functions.column.update_text(3)
        else
        end
        fileManager.functions.column.update_selection(i)
    elseif i == 3 then
        fileManager[1].path = fileManager[2].path
        fileManager[2].path = fileManager[3].path
        if fileManager[3].entry[j].dir then
            fileManager[3].path = fileManager[3].path .. fileManager[3].entry[j].text .. "/"
        else
            fileManager[3].path = nil
        end
        fileManager[1].first = fileManager[2].first
        fileManager[2].first = fileManager[3].first
        fileManager[3].first = 1
        fileManager[1].selected = fileManager[2].selected
        fileManager[2].selected = j
        fileManager.functions.entries.update()
        fileManager.functions.fileManager.update()
    end
end

fileManager.functions.entry.scrollDown = function(i)
    if #fileManager[i].entry == fileManager.numberOfEntries then
        fileManager[i].first = fileManager[i].first + 1
        fileManager.functions.entries.update(i)
        fileManager.functions.column.update(i)
    end
end

fileManager.functions.entry.scrollUp = function(i)
    if fileManager[i].first > 1 then
        fileManager[i].first = fileManager[i].first - 1
        fileManager.functions.entries.update(i)
        fileManager.functions.column.update(i)
    end
end
