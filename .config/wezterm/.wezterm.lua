local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.color_scheme = "catppuccino"
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	{ family = "Symbols Nerd Font", scale = 0.75 },
})
config.use_cap_height_to_scale_fallback_fonts = true
config.font_size = 20
config.scrollback_lines = 5000
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.7

return config
