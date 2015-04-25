function addClient(t, c)
  --save data of floating windows
  if awful.client.floating.get(c) then
    clientData[c] = c:geometry()
    clientStruts[c] = c:struts()
    c:struts({ right = 0 })
    awful.client.floating.set(c, false)
  end
  -- add the client to the revelation tag
  awful.client.toggletag(t, c)
  c.minimized = false
  c.border_width = 30
  c.border_color = "#00000004"
end


function addClients(t, clients) -- <--clients is a table
  for _, c in pairs(clients) do
    if c.name~="cairo-dock" then
      addClient(t, c)
    end
  end
end

function selectfn(restore)
  return function(c)
    restore()
    -- Pop to client tag
    awful.tag.viewonly(c:tags()[1], c.screen)
    -- Focus and raise the client
    client.focus = c
    c:raise()
  end
end


function keyboardhandler (restore)
  return function (mod, key, event)
    if event ~= "press" then return true end

    local customKeys = { 
      j = "Down",
      k = "Up",
      h = "Left",
      l = "Right"
    }

    for k,v in pairs(customKeys) do
      if key == k then
        key = v
      end
    end

    if key == "Escape" then
      restore()
      return false
    elseif key == "Return" or key == " " then
      selectfn(restore)(client.focus)
      return false
    elseif key == "Left" or key == "Right" or key == "Up" or key == "Down" then
      awful.client.focus.bydirection(key:lower())
    end

    return true
  end
end

function mousehandler(restore)
  local pressedMiddle = false
  return function(mouse)
    local c = awful.mouse.client_under_pointer()
    --client.focus = c
    if mouse.buttons[1] == true then
      selectfn(restore)(c)
      return false
    elseif mouse.buttons[2] == true and pressedMiddle == false and c ~= nil then -- is true whenever the button is down. 
      pressedMiddle = true -- extra variable needed to prevent script from spam-closing windows
      c:kill()
      return true
    elseif mouse.buttons[2] == false and pressedMiddle == true then
      pressedMiddle = false
    end

    return true
  end
end

function expose(s)
  -- Add a the tag revelation
  local t = awful.tag.new({"Expose"}, s, awful.layout.suit.fair.horizontal)[1]
  awful.tag.viewonly(t, s)

  -- Add clients to the tag
  clientData = {} -- table for data of floating windows
  clientStruts = {}
  addClients(t, client.get(s))

  -- Function to clean up the mess with going to a specific window
  local function restore()
    cs = client.get(s)
    for _, clientus in pairs(cs) do
      clientus.border_width = beautiful.border_width
      clientus.border_color = beautiful.border_normal
    end

    awful.tag.history.restore()

    keygrabber.stop()
    mousegrabber.stop()

    for _, c in pairs(client.get(s)) do
      if clientData[c] then -- Restore floating windows
        c:geometry(clientData[c]) -- Restore positions and sizes
        c:struts(clientStruts[c]) -- Restore struts
        awful.client.floating.set(c, true)
      end
    end

    awful.tag.setscreen(t, nil) -- this must be at the end, otherwise the Expose-tag won't be deleted by pressing Escape
  end

  -- Start waiting for input (keyboard and mouse)
  keygrabber.run(keyboardhandler(restore))
  mousegrabber.run(mousehandler(restore),"fleur")
end

