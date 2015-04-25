--awful = {}
--awful.util = {}
--awful.util.pread = function(str)
  --f = io.popen(str)
  --return f:read("*a")
--end

whatToDoWithThisEntry = function(entry)
  return ""
end

getDirectoryEntries = function(path)
  -- path must be path to a directory and ending with a slash!!
  local res = {}

  local str = awful.util.pread("ls -1 --file-type " .. path)

  for line in string.gmatch(str, "[^\n]+") do
    string.gsub(line, "^(%s)*", "")
    string.gsub(line, "(%s)*$", "")
    if line ~= "" then 
      if string.match(line, "/$") == nil then
        local command = whatToDoWithThisEntry(line)
        table.insert(res, {line, command})
      else
        local dir = string.sub(line, 1, string.len(line)-1)
        local subEntries = getDirectoryEntries(path .. line)
        table.insert(res, {dir, subEntries})
      end
    end
  end

  return res
end


--Widget
generateTreeFileMenu = function(path)
  ----path must be path to a directory and ending with a slash!!
  m = awful.menu({items = getDirectoryEntries(path)})
  return m
end

treeFileMenuPath = "/home/laurin/Dropbox/Ausbildung/MathematicsBSc/2012FS/"
treeFileMenu = generateTreeFileMenu(treeFileMenuPath)

treeFileMenuWidget = widget({type = "textbox"})
treeFileMenuWidget.text = " Home "
treeFileMenuWidget:buttons(awful.util.table.join(
  awful.button({}, 1, function() treeFileMenu:toggle() end),
  awful.button({}, 2, function() treeFileMenu = generateTreeFileMenu(treeFileMenuPath) end)
))
