local wezterm = require("wezterm")

return {
	window_decorations = "RESIZE",
	color_scheme = "catppuccin",
	font = wezterm.font_with_fallback({
		"JetBrains Mono",
		{ family = "Symbols Nerd Font Mono", scale = 0.75 },
	}),
	use_cap_height_to_scale_fallback_fonts = true,
	font_size = 12,
	scrollback_lines = 5000,
	hide_tab_bar_if_only_one_tab = true,

	window_background_opacity = 0.8,
}
