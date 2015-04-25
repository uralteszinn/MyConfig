set :border, 2
set :step, 5
set :snap, 10
set :gravity, :center
set :urgent, false
set :resize, false
set :strut, [ 0, 0, 0, 0 ]
set :font, "xft:BitStreamVeraSansMono-8"
set :gap, 0
set :padding, [ 0, 0, 0, 0 ]
set :separator, "|"
set :outline, 0



screen 1 do
  top    [ :views, :separator, :title, :keychain, :spacer, :tray, :separator, :sublets ]
  bottom [  ]
end



color :title_fg,        "#fecf35"
color :title_bg,        "#202020"
color :title_border,    "#303030"
color :focus_fg,        "#fecf35"
color :focus_bg,        "#202020"
color :focus_border,    "#303030"
color :urgent_fg,       "#ff9800"
color :urgent_bg,       "#202020"
color :urgent_border,   "#303030"
color :occupied_fg,     "#b8b8b8"
color :occupied_bg,     "#202020"
color :occupied_border, "#303030"
color :views_fg,        "#757575"
color :views_bg,        "#202020"
color :views_border,    "#303030"
color :sublets_fg,      "#757575"
color :sublets_bg,      "#202020"
color :sublets_border,  "#303030"
color :client_active,   "#303030"
color :client_inactive, "#202020"
color :panel,           "#202020"
color :background,      "#3d3d3d"
color :stipple,         "#757575"
color :separator,       "#757575"



gravity :top_left,       [   0,   0,  50,  50 ]
gravity :top_left66,     [   0,   0,  50,  66 ]
gravity :top_left33,     [   0,   0,  50,  34 ]
gravity :top,            [   0,   0, 100,  50 ]
gravity :top66,          [   0,   0, 100,  66 ]
gravity :top33,          [   0,   0, 100,  34 ]
gravity :top_right,      [ 100,   0,  50,  50 ]
gravity :top_right66,    [ 100,   0,  50,  66 ]
gravity :top_right33,    [ 100,   0,  50,  34 ]
gravity :left,           [   0,   0,  50, 100 ]
gravity :left66,         [   0,  50,  50,  34 ]
gravity :left33,         [   0,  50,  25,  34 ]
gravity :center,         [   0,   0, 100, 100 ]
gravity :center66,       [   0,  50, 100,  34 ]
gravity :center33,       [  50,  50,  50,  34 ]
gravity :right,          [ 100,   0,  50, 100 ]
gravity :right66,        [ 100,  50,  50,  34 ]
gravity :right33,        [ 100,  50,  25,  34 ]
gravity :bottom_left,    [   0, 100,  50,  50 ]
gravity :bottom_left66,  [   0, 100,  50,  66 ]
gravity :bottom_left33,  [   0, 100,  50,  34 ]
gravity :bottom,         [   0, 100, 100,  50 ]
gravity :bottom66,       [   0, 100, 100,  66 ]
gravity :bottom33,       [   0, 100, 100,  34 ]
gravity :bottom_right,   [ 100, 100,  50,  50 ]
gravity :bottom_right66, [ 100, 100,  50,  66 ]
gravity :bottom_right33, [ 100, 100,  50,  34 ]

gravity :gimp_image,     [  50,  50,  80, 100 ]
gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
gravity :gimp_dock,      [ 100,   0,  10, 100 ]



grab "A-S-1", :ViewJump1
grab "A-S-2", :ViewJump2
grab "A-S-3", :ViewJump3
grab "A-S-4", :ViewJump4

grab "A-1", :ViewSwitch1
grab "A-2", :ViewSwitch2
grab "A-3", :ViewSwitch3
grab "A-4", :ViewSwitch4

grab "A-i",  :ViewNext
grab "A-h",  :ViewPrev

grab "W-A-1", :ScreenJump1
grab "W-A-2", :ScreenJump2
grab "W-A-3", :ScreenJump3
grab "W-A-4", :ScreenJump4

grab "A-C-r", :SubtleReload
grab "A-C-S-r", :SubtleRestart
grab "A-C-q", :SubtleQuit

grab "A-B1", :WindowMove
grab "A-B3", :WindowResize
grab "A-f", :WindowFloat
grab "A-space", :WindowFull
grab "A-s", :WindowStick
grab "A-r", :WindowRaise
grab "A-l", :WindowLower
grab "A-Left",  :WindowLeft
grab "A-Down",  :WindowDown
grab "A-Up",    :WindowUp
grab "A-Right", :WindowRight
grab "A-n",  :WindowDown
grab "A-e",    :WindowUp
grab "A-S-k", :WindowKill
grab "A-S-Return", :WindowKill

#grab "W-l", [ :top_left,     :top_left66,     :top_left33,     ]
#grab "W-u", [ :top,          :top66,          :top33,          ]
#grab "W-y", [ :top_right,    :top_right66,    :top_right33,    ]
#grab "W-n", [ :left,         :left66,         :left33,         ]
#grab "W-e", [ :center,       :center66,       :center33,       ]
#grab "W-i", [ :right,        :right66,        :right33,        ]
#grab "W-k", [ :bottom_left,  :bottom_left66,  :bottom_left33,  ]
#grab "W-m", [ :bottom,       :bottom66,       :bottom33,       ]
#grab "W-,", [ :bottom_right, :bottom_right66, :bottom_right33 ]

grab "A-Return", "urxvtc"
grab "A-b", "firefox"
grab "XF86WWW", "firefox"
grab "A-w", "wicd-client -n"
grab "A-o", "dmenu_run"

grab "S-F2" do |c|
  puts c.name
end

grab "S-F3" do
  puts Subtlext::VERSION
end



tag "terms" do
  match "xterm|[u]?rxvt[c]?"
end

tag "browser" do
  match "uzbl|opera|firefox|navigator|chromium|google-chrome"
end

tag "pdfviewer" do
  match "evince|zathura"
end

tag "tex" do
#  match :name => ".*?\.tex (.*) - GVIM"
#  match :name => ".+?\.tex .*"
#  match ".+?tex.*"
  match name: ".*test.*"
  gravity :left
end

tag "editor" do
  match  "[g]?vim"
#  resize true
end

tag "fixed" do
  geometry [ 10, 10, 100, 100 ]
  stick    true
end

#tag "resize" do
#  match  "sakura|gvim"
#  resize true
#end

#tag "gravity" do
#  gravity :center
#end

# Modes
tag "stick" do
  match "mplayer"
  float true
  stick true
end

tag "float" do
  match "display"
  float true
end

# Gimp
tag "gimp_image" do
  match   :role => "gimp-image-window"
  gravity :gimp_image
end

tag "gimp_toolbox" do
  match   :role => "gimp-toolbox$"
  gravity :gimp_toolbox
end

tag "gimp_dock" do
  match   :role => "gimp-dock"
  gravity :gimp_dock
end



view "www" do
  match "browser"
end

view "term" do
  match "terms"
end

view "vim" do
  match "editor"
end

view "pdf" do
  match "pdfviewer"
end

view "tex" do
  match "tex"
end

view "else" do
  match "default"
end

view "gimp" do
  match "gimp_.*"
end



sublet :clock do
  interval      1
  format_string "%H:%M"
end

sublet :battery do
  interval      1
end

sublet :wifi do
  interval      1
end
  
sublet :volume do
  interval      1
end
