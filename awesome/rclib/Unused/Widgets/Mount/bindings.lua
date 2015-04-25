for i = 1, #mountTextboxes do
  mountTextboxes[i].textbox:buttons(awful.util.table.join(
    awful.button({ },1, function() mountMountPoint(mountInfo[i].mountPoint) end),
    awful.button({ },3, function() unmountMountPoint(mountInfo[i].mountPoint) end),
    awful.button({ },2, function() startFileManager(mountInfo[i].mountPoint) end)
  ))
end
