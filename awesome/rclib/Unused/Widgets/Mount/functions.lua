getMountInfo = function()
  local entries = {}

  str = awful.util.pread("cat /etc/fstab | grep user | awk '{print $1}'")

  local i = 0

  for line in string.gmatch(str, "[^%s]+") do
    i = i + 1
    entries[i] = {}
    entries[i].fsName = line
  end

  str = awful.util.pread("cat /etc/fstab | grep user | awk '{print $2}'")

  local i = 0

  for line in string.gmatch(str, "[^%s]+") do
    i = i + 1
    entries[i].mountPoint = line
  end

  str = awful.util.pread("cat /etc/fstab | grep user | awk '{print $3}'")

  local i = 0

  for line in string.gmatch(str, "[^%s]+") do
    i = i + 1
    entries[i].fsType = line
  end

  updateMounted(entries)

  return entries
end

updateMounted = function(entries)
  for i = 1, #entries do
    local str = awful.util.pread('cat /etc/mtab | grep "' .. entries[i].mountPoint .. ' "')
    if str == "" then
      entries[i].mounted = false
    else
      entries[i].mounted = true
    end
  end
end

mountMountPoint = function(mp)
  awful.util.spawn("mount " .. mp)
end

unmountMountPoint = function(mp)
  awful.util.spawn("umount " .. mp)
end

mountUpdateFunction = function(entries)
  updateMounted(entries)
  for i = 1, #entries do
    local anzeige
    if entries[i].mounted == true then 
      anzeige = "<span font='11' color='" .. mountColor.mounted .. "'>✓</span>"
    else
      anzeige = "<span font='11' color='" .. mountColor.notMounted .. "'>✗</span>"
    end
    mountTextboxes[i].textbox:set_markup(anzeige .. " " .. entries[i].mountPoint)
    mountTextboxes[i].background:set_fg(mountColor.fg)
  end
end
