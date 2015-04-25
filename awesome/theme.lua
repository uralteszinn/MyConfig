-----------------------------
-- MyDefault awesome theme --
-----------------------------

theme = {}

-------------------------------------------------------------------------------

-- Font
theme.fontSize                     = 10
theme.font                         = "Bitstream Vera Sans Mono " .. theme.fontSize

-- Wallpaper
theme.backgroundColor              = "black"
theme.useWallpaper                 = false
theme.wallpaper                    = wlp_path .. "Tux-Linux.png"

-------------------------------------------------------------------------------

-- General
theme.bg_normal                    = "#000000"
theme.fg_normal                    = "#888888"
theme.bg_focus                     = "#000000"
theme.fg_focus                     = "#ffa500"
theme.bg_ready                     = "#008800"
theme.fg_ready                     = "#000000"
theme.bg_warning                   = "#000000"
theme.fg_warning                   = "#ffff00"
theme.bg_urgent                    = "#ff0000"
theme.fg_urgent                    = "#000000"
theme.bg_error                     = "#ff0000"
theme.fg_error                     = "#000000"
theme.bg_minimize                  = "#444444"
theme.fg_minimize                  = "#ffffff"

theme.border_width                 = 1
theme.border_normal                = "#000000"
theme.border_focus                 = "#111111"
theme.border_marked                = "#91231c"

-- Client
theme.client_bg_focus              = "#333333"

-------------------------------------------------------------------------------

-- Taglist
--theme.taglist_bg_focus             = theme.bg_focus
theme.taglist_bg_focus             = "#ffa500"
theme.taglist_fg_focus             = "#000000"
theme.taglist_bg_urgent            = theme.bg_urgent
theme.taglist_fg_urgent            = theme.fg_urgent
--theme.taglist_bg_empty             = "#000000"
--theme.taglist_fg_empty             = "#333333"
theme.taglist_bg_occupied          = "#444444"
theme.taglist_fg_occupied          = "#999999"
theme.taglist_squares_sel          = ico_path .. "awesomeTaglist/squarefz.png"
theme.taglist_squares_unsel        = ico_path .. "awesomeTaglist/squarez.png"

-- Tasklist
theme.tasklist_bg_focus            = theme.bg_focus
theme.tasklist_fg_focus            = theme.fg_focus
theme.tasklist_bg_urgent           = theme.bg_urgent
theme.tasklist_fg_urgent           = theme.fg_urgent
theme.tasklist_floating_icon       = ico_path .. "awesomeTasklist/floatingw.png"

-- Titlebar
theme.titlebar_bg_normal           = theme.bg_normal
theme.titlebar_fg_normal           = theme.fg_normal
theme.titlebar_bg_focus            = theme.bg_focus
theme.titlebar_fg_focus            = theme.fg_focus
theme.titlebar_close_button_normal              = ico_path .. "awesomeTitlebar/close_normal.png"
theme.titlebar_close_button_focus               = ico_path .. "awesomeTitlebar/close_focus.png"
theme.titlebar_ontop_button_normal_inactive     = ico_path .. "awesomeTitlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = ico_path .. "awesomeTitlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = ico_path .. "awesomeTitlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = ico_path .. "awesomeTitlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = ico_path .. "awesomeTitlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = ico_path .. "awesomeTitlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = ico_path .. "awesomeTitlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = ico_path .. "awesomeTitlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = ico_path .. "awesomeTitlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = ico_path .. "awesomeTitlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = ico_path .. "awesomeTitlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = ico_path .. "awesomeTitlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = ico_path .. "awesomeTitlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = ico_path .. "awesomeTitlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = ico_path .. "awesomeTitlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = ico_path .. "awesomeTitlebar/maximized_focus_active.png"

-------------------------------------------------------------------------------

-- Menu
theme.menu_bg_normal               = theme.bg_normal
theme.menu_fg_normal               = theme.fg_normal
theme.menu_bg_focus                = theme.bg_focus
theme.menu_fg_focus                = theme.fg_focus
theme.menu_height                  = 15
theme.menu_width                   = 100
theme.menu_border_width            = theme.border_width
theme.menu_border_color            = theme.border_color
theme.menu_submenu_icon            = ico_path .. "submenu.png"

-------------------------------------------------------------------------------

-- Naughty
theme.naughty_bg_normal            = "#6495ed"
theme.naughty_fg_normal            = "#000000"

theme.naughty_bg_critical          = theme.bg_urgent
theme.naughty_fg_critical          = theme.fg_urgent
theme.naughty_timeout_critical     = 10

-- Tooltip
theme.tooltip_bg_color             = theme.fg_normal
theme.tooltip_fg_color             = theme.bg_normal
theme.tooltip_font                 = 8
theme.tooltip_border_width         = 1
theme.tooltip_border_color         = theme.border_color
theme.tooltip_position             = "top_left"

-------------------------------------------------------------------------------

-- Mouse Finder
theme.mouse_finder_color           = "#ffffff"
theme.mouse_finder_timeout         = 1
theme.mouse_finder_animate_timeout = 0.05
theme.mouse_finder_radius          = 10
theme.mouse_finder_factor          = 15

-------------------------------------------------------------------------------

-- Layouts
theme.layout_tile                  = ico_path .. "awesomeLayouts/tile.png"
theme.layout_tileleft              = ico_path .. "awesomeLayouts/tileleft.png"
theme.layout_tilebottom            = ico_path .. "awesomeLayouts/tilebottom.png"
theme.layout_tiletop               = ico_path .. "awesomeLayouts/tiletop.png"
theme.layout_fairv                 = ico_path .. "awesomeLayouts/fairv.png"
theme.layout_fairh                 = ico_path .. "awesomeLayouts/fairh.png"
theme.layout_spiral                = ico_path .. "awesomeLayouts/spiral.png"
theme.layout_dwindle               = ico_path .. "awesomeLayouts/dwindle.png"
theme.layout_max                   = ico_path .. "awesomeLayouts/max.png"
theme.layout_fullscreen            = ico_path .. "awesomeLayouts/fullscreen.png"
theme.layout_magnifier             = ico_path .. "awesomeLayouts/magnifier.png"
theme.layout_floating              = ico_path .. "awesomeLayouts/floating.png"

-------------------------------------------------------------------------------

return theme
