local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.color_scheme = "catppuccino"
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	{ family = "Symbols Nerd Font", scale = 0.75 },
})
config.use_cap_height_to_scale_fallback_fonts = true
config.font_size = 12
config.scrollback_lines = 5000
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.7

return config
-- return {
-- 	window_close_confirmation = "NeverPrompt",
-- 	window_decorations = "RESIZE",
-- 	color_scheme = "catppuccin",
-- 	font = wezterm.font_with_fallback({
-- 		"JetBrains Mono",
-- 		{ family = "Symbols Nerd Font Mono", scale = 0.75 },
-- 	}),
-- 	use_cap_height_to_scale_fallback_fonts = true,
-- 	font_size = 12,
-- 	scrollback_lines = 5000,
-- 	hide_tab_bar_if_only_one_tab = true,
--
-- 	window_background_opacity = 0.7,
-- }
