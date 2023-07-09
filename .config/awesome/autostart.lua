local awful = require("awful")

local autorun = true

local autorunScripts = {
	"xrandr --output DisplayPort-1 --primary",
	"feh --bg-fill $HOME/dot_files/wallpapers/tux-linux-color.jpg",
}

if autorun then
	for script = 1, #autorunScripts do
		awful.spawn.with_shell(autorunScripts[script])
	end
end
