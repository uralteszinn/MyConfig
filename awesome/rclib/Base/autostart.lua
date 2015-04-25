startProg("urxvtd", "-q -o -f")
startProg("wpa_gui", "-t")

startProg("dropboxd", nil, "dropbox" )
startProg("dropbox", nil, "dropbox" )

awful.tag.viewonly(tags[1][2])
