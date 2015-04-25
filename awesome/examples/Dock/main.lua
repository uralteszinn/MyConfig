dofile(cof_path .. "Dock/Launchers/firefox.lua")




myHiddenDock = {}
myDock = {}

showDock = function()
  myDock[mouse.screen].visible = true
  myHiddenDock[mouse.screen].visible = false
end

hideDock = function()
  myHiddenDock[mouse.screen].visible = true
  myDock[mouse.screen].visible = false
end


for s = 1, screen.count() do
    myDock[s] = awful.wibox({ position = "bottom" , screen = s , border_width = "0" , border_color = "red" , height = 42 , width = 600 ,  align = "center" })
    myHiddenDock[s] = awful.wibox({ position = "bottom" , screen = s , border_width = "0" , border_color = "red" , height = 1 , width = 600 ,  align = "center" })
    -- Add widgets to the wibox - order matters
    myHiddenDock[s].widgets = {
        {
          layout = awful.widget.layout.horizontal.leftright
        },
          layout = awful.widget.layout.horizontal.rightleft
        }

    myDock[s].widgets = {
        {
          firefoxLauncher,
          layout = awful.widget.layout.horizontal.leftright
        },
          s == 1 and mysystray or nil,
          leerschlag,
          tastaturlayoutch,
          tastaturlayoutdvp,
          tastaturlayoutcol,
          leerschlag,
          aufanfrag,
          sparsam,
          schnell,
          layout = awful.widget.layout.horizontal.rightleft
        }

    myHiddenDock[s]:add_signal("mouse::enter", showDock)
    myDock[s]:add_signal("mouse::leave", hideDock)

    myDock[s].visible = false
    myHiddenDock[s].visible = true
end


