local awful = require("awful")

local autorun = true

local autorunScripts = {
	"discord",
	"dunst",
	"flameshot",
	"nm-applet",
	"picom",
	"steam",
	"xrandr --output DisplayPort-1 --primary",
}

if autorun then
	for script = 1, #autorunScripts do
		awful.spawn.with_shell(autorunScripts[script])
	end
end
