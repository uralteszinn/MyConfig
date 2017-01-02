modkey            = "Mod4"

ico_path          = lib_path .. "Icons/"
wlp_path          = lib_path .. "Wallpapers/"

terminal          = "urxvtc"
browser           = "firefox"
pdfviewer         = "evince"
networkmanager    = "wicd-client -n"
filemanager       = "nautilus"
applauncher       = "dmenu_run"
editor            = os.getenv("EDITOR") or "gvim"

editor_cmd        = terminal .. " -e " .. editor

suspend_cmd       = "systemctl suspend"
poweroff_cmd      = "systemctl poweroff"
reboot_cmd        = "systemctl reboot"

pacman_update_cmd = "urxvtc -hold -e zsh -c \"sudo pacman -Syyu\""

