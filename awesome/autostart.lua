local awful = require("awful")

local apps = {
	"discord",
	"dunst",
	"flameshot",
	"nm-applet",
	"picom",
	"slack",
	"steam",
	"teams",
	"xrandr --output DP-2 --primary --mode 3840x2160 --rate 144",
	"xrandr --output DP-3 --mode 3840x2160 --rate 144",
}

awful.spawn.once("alacritty", {
	screen = 1,
	tag = "1",
})

for _, app in pairs(apps) do
	awful.spawn.once(app)
end
