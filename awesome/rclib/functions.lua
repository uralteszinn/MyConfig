function getHomeDirectory()
  local path = awful.util.pread("echo $HOME")
  return string.sub(path, 1, string.len(path)-1) .. "/"
end

function getComputerProperties()
  local path = getHomeDirectory() .. ".awesomeSettings.lua"
  if awful.util.file_readable(path) then
    dofile(path)
  else 
    awful.util.spawn("cp " .. lib_path .. "awesomeSettingsExample.lua " .. path)
    dofile(lib_path .. "awesomeSettingsExample.lua")
  end
end

function doWidget(name, awesomeness)
  if not awesomeness then awesomeness = 10 end
  if awesomeness <= awesomeSettings.awesomeness then
    widgetPath = lib_path .. "Widgets/" .. name .. "/"
    dofile(widgetPath .. "main.lua")
  end
end

function doExtended(name, awesomeness)
  if not awesomeness then awesomeness = 10 end
  if awesomeness <= awesomeSettings.awesomeness then
    extendedPath = lib_path .. "Extended/" .. name .. "/"
    dofile(extendedPath .. "main.lua")
  end
end

function doBase(name)
  dofile(lib_path .. "Base/" .. name .. ".lua")
end

function tooltip(widget)

end

function startProg(prg_name, opts, process_name)
  opts = opts or ""
  process_name = process_name or prg_name
  if awful.util.pread("ps -e | grep " .. process_name) == "" then
    awful.util.spawn(prg_name .. " " .. opts)
  end
end

function stopProg(str)
  awful.util.spawn("killall " .. str)
end

function startFileManager(path)
  awful.util.spawn(filemanager .. " " .. path)
end

function setDefaultTag(c,s,t)
  if not next(c:tags()) then
    c:tags({tags[s][t]})
  end
end

-- wibox: Wibox
-- s: screen
-- xQuotient: number between 0 and 100 (percentage of the screen from top left corner) default: 0
-- yQuotient: number between 0 and 100 (percentage of the screen from top left corner) default: 0
-- horizontallyAt: "left", "center", "right" (aligns the left, center, right of the wibox with the given point) default: left
-- verticallyAt: "top", "center", "bottom" (aligns the top, center, bottom of the wibox with the given point) default: top
-- mode: "g" or "w" (uses the geometry or the workarea on the given screen) default: geometry
-- ignore(...)Border: true or false (shall the (...) border be considered or not) default: false
function wiboxPositioning(wibox, s, xQuotient, yQuotient, horizontallyAt, verticallyAt, mode, ignoreHorizontalBorder, ignoreVerticalBorder)
  if not xQuotient              then xQuotient              = 0        end
  if not yQuotient              then yQuotient              = 0        end
  if not horizontallyAt         then horizontallyAt         = "center" end
  if not verticallyAt           then verticallyAt           = "center" end
  if not mode                   then mode                   = "g"      end
  if not ignoreHorizontalBorder then ignoreHorizontalBorder = false    end
  if not ignoreVerticalBorder   then ignoreVerticalBorder   = false    end

  xQuotient = xQuotient/100
  yQuotient = yQuotient/100
 
  local table = screen[s].geometry
  if mode == "w" then
    table = screen[s].workarea
  end
 
  wibox.x = table.x + xQuotient * table.width
  wibox.y = table.y + yQuotient * table.height
  
  if horizontallyAt == "left" then
    if ignoreVerticalBorder then
      wibox.x = wibox.x - wibox.border_width
    end
  elseif horizontallyAt == "center" then
    wibox.x = wibox.x - wibox.width/2 - wibox.border_width
  elseif horizontallyAt == "right" then
    wibox.x = wibox.x - wibox.width - wibox.border_width
    if not ignoreVerticalBorder then
      wibox.x = wibox.x - wibox.border_width
    end
  else
    naughty.notify({ screen    = s,
                     title     = "Placement Error",
                     text      = "'" .. horizontallyAt .. "' is not a valid horizontal alignment!",
                     preset    = naughty.config.presets.critical,
                  })
  end

  if verticallyAt == "top" then
    if ignoreHorizontalBorder then
      wibox.y = wibox.y - wibox.border_width
    end
  elseif verticallyAt == "center" then
    wibox.y = wibox.y - wibox.height/2 - wibox.border_width
  elseif verticallyAt == "bottom" then
    wibox.y = wibox.y - wibox.height - wibox.border_width
    if not ignoreHorizontalBorder then
      wibox.y = wibox.y - wibox.border_width
    end
  else
    naughty.notify({ screen    = s,
                     title     = "Placement Error",
                     text      = "'" .. verticallyAt .. "' is not a valid vertical alignment!",
                     preset    = naughty.config.presets.critical,
                  })
  end
end

function countAll(table)
  local count = 0
  for _,_ in pairs(table) do 
    count = count + 1
  end
  return count
end

function awfulXModMap(keycode, action)
  if type(keycode) == "number" then
    awful.util.spawn('xmodmap -e "keycode ' .. tostring(keycode) .. ' = ' .. action .. '"')
    naughty.notify({ title = "Awful XModMap",
                     text  = action .. " mapped to Keycode " .. tostring(keycode) })
  end
end

function awfulSetXKBMap(layout)
  awful.util.spawn("setxkbmap " .. layout)
  naughty.notify({title = "Keyboard Layout",
                  text  = layout .. " active"})
end

function printDebug(str)
  naughty.notify({title = "Print Debug",
                  text  = str})
end
