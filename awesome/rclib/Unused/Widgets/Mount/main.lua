dofile(widgetPath .. "settings.lua")
dofile(widgetPath .. "functions.lua")

mountInfo = getMountInfo()

if next(mountInfo) then -- mountInfo is not empty
  dofile(widgetPath .. "textboxes.lua")

  mountTextboxes = createMountTextboxes(mountInfo)

  dofile(widgetPath .. "wibox.lua")
  dofile(widgetPath .. "timer.lua")
  dofile(widgetPath .. "bindings.lua")

  mountUpdateFunction(mountInfo)
end
