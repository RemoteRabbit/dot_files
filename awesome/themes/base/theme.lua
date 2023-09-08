local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local palette = require("themes.base.mocha")

local theme = {}

theme.font = "JetBrainsMono Nerd Font 20"

theme.bg_normal = palette.base.hex
theme.bg_focus = palette.overlay0.hex
theme.bg_urgent = palette.red.hex
theme.bg_minimize = palette.overlay2.hex
theme.bg_systray = theme.bg_normal

theme.fg_normal = palette.overlay2.hex
theme.fg_focus = palette.base.hex
theme.fg_urgent = palette.red.hex
theme.fg_minimize = palette.rosewater.hex

theme.useless_gap = dpi(10)
theme.border_width = dpi(1)
theme.border_normal = palette.sky.hex
theme.border_focus = palette.rosewater.hex
theme.border_marked = palette.red.hex

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- local rffd = require("scripts.rand-file-from-dir")
theme.wallpaper = "/home/remoterabbit/Pictures/wallpapers/pexels-irina-iriser-1379636.jpg"
-- for wallpaper, attr in rffd.dirtree("/home/remoterabbit/Pictures/wallpapers") do
-- 	print(attr.mode, wallpaper)
-- end

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "default/layouts/fairvw.png"
theme.layout_floating = themes_path .. "default/layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "default/layouts/magnifierw.png"
theme.layout_max = themes_path .. "default/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "default/layouts/tilew.png"
theme.layout_tiletop = themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "Oranchelo"

return theme
