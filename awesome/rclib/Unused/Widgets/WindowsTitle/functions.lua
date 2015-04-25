function clearWindowsTitle(c)
  windowsTitle[mouse.screen].textbox:set_text("")
  windowsTitle[mouse.screen].icon:set_image()
end

function updateWindowsTitleText()
  windowsTitle[mouse.screen].textbox:set_text(client.focus.name)
end

function updateWindowsTitleIcon()
  windowsTitle[mouse.screen].icon:set_image(client.focus.icon)
end

function updateWindowsTitle()
  windowsTitle[mouse.screen].textbox:set_text(client.focus.name)
  windowsTitle[mouse.screen].icon:set_image(client.focus.icon)
end
