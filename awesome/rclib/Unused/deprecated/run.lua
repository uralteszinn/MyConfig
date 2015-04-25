myRunBox = {}
for s = 1, screen.count() do
  myRunBox[s] = wibox.widget.textbox()
  myRunBox[s]:set_ellipsize("start")
end

runFunction = function () 
  myRunWibox[mouse.screen].visible = true
  awful.prompt.run({ prompt = beautiful.runWiboxPrompt, 
                     bg_cursor = beautiful.runWiboxCursorColor,
                   },
                     myRunBox[mouse.screen],
                     awful.util.spawn_with_shell,
                     awful.completion.shell,
                     awful.util.getdir("cache") .. "/history_run", 500,
                     function()
                       myRunWibox[mouse.screen].visible = false
                     end
                   )
end
