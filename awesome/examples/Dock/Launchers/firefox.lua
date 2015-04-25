firefoxLauncher = widget({type="imagebox"})
firefoxLauncher.image=image( cof_path .. "Dock/LauncherIcons/firefox.png" )
firefoxLauncher:buttons(awful.util.table.join(
  awful.button({},1,
    function()
      awful.util.spawn("firefox")
    end )))
