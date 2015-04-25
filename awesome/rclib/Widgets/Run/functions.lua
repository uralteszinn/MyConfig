runFunction = function () 
  local currentScreen = mouse.screen
  runWibox[currentScreen].visible = true
  awful.prompt.run({ prompt = runPrompt,
                     bg_cursor = runColor.cursor,
                   },
                     runTextbox,
                     awful.util.spawn_with_shell,
                     awful.completion.shell,
                     awful.util.getdir("cache") .. "/history_run", 500,
                     function()
                       runWibox[currentScreen].visible = false
                     end
                   )
end
