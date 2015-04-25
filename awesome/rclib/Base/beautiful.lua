beautiful.init(cfg_path .. "theme.lua")

awful.util.spawn("xsetroot -solid " .. beautiful.backgroundColor)
if beautiful.useWallpaper then
  if beautiful.wallpaper then
    for s = 1, screen.count() do
      gears.wallpaper.maximized(beautiful.wallpaper, s, false)
    end
  end
end
