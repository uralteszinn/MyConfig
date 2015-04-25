--myBatWibox = awful.wibox({ position = "right", screen = 1 })
--myBatWibox:geometry({width  = beautiful.batWidth,
                     --height = screen[1].geometry.height - beautiful.topWiboxHeight,
                     --y      = beautiful.topWiboxHeight,
                    --})
myBatWibox         = wibox({ screen = 1 })
myBatWibox.width   = beautiful.batWidth
myBatWibox.height  = screen[1].geometry.height - beautiful.topWiboxHeight
myBatWibox.x       = screen[1].geometry.width - beautiful.batWidth
myBatWibox.y       = beautiful.topWiboxHeight
myBatWibox.visible = true
--myBatWibox.ontop   = true

myBatWibox:struts({ right = beautiful.batWidth })

dofile(wgt_path .. "battery.lua")

myBatWibox:set_widget(batPB)

checkBat()
