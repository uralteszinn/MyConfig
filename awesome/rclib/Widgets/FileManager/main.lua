fileManager = {}
fileManager.height = {}
fileManager.width = {}
fileManager.color = {}
fileManager.color.textbox = {}
fileManager.color.wibox = {}

dofile(widgetPath .. "settings.lua")

fileManager.font = fileManager.fontName .. ", " .. fileManager.fontSize
fileManager.height.wibox = fileManager.numberOfEntries*(fileManager.height.textbox+2*fileManager.height.textboxMargin)+2*fileManager.height.wiboxMargin

for i=1,3 do
    fileManager[i] = {}
    fileManager[i].entry = {}
end

dofile(widgetPath .. "functions.lua")

fileManager[1].path = fileManager.functions.path.parent(fileManager.initialPath)
fileManager[2].path = fileManager.initialPath
fileManager[3].path = nil

fileManager[1].first = 1
fileManager[2].first = 1
fileManager[3].first = 1

fileManager[1].selected = 1
fileManager[2].selected = 1
fileManager[3].selected = nil


--fileManagerPathStack = splitPath(fileManagerInitialPath)



dofile(widgetPath .. "textbox.lua")
dofile(widgetPath .. "wibox.lua")
dofile(widgetPath .. "bindings.lua")

--- = Testing = ---

fileManager.functions.entries.update()
fileManager.functions.fileManager.update()

--fileManager[1].entry.selected = {93}
--fileManager.functions.update_column_selection(1)
--fileManager.functions.column.update_text(1)
--fileManager.functions.column.update_text(3)
--fileManager.functions.fileManager.update_text()
--fileManager.functions.entries.populate(1,"/home/")
--fileManager.functions.entries.populate(2,"/home/laurin/")
--fileManager.functions.entries.populate(3,"/home/laurin/Dropbox")
--fileManager.functions.entry.selectOnly(2,3)
--fileManager.functions.fileManager.update()
