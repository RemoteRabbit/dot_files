local leader = "cmd"
hs.loadSpoon("SpoonInstall") -- Used to automatically pull and install spoons

-- Use to hot reload when config files are changed (on save)
local function reloadConfig(files)
	local doReload = false
	for _, file in pairs(files) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.reload()
	end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.notify
	.new({
		title = "Hammerspoon",
		informativeText = "Config loaded!",
	})
	:send()

spoon.SpoonInstall:andUse("Calendar")

spoon.SpoonInstall:andUse("WindowHalfsAndThirds", {
	hotkeys = {
		left_half = { { "ctrl", leader }, "h" },
		right_half = { { "ctrl", leader }, "l" },
		top_half = { { "ctrl", leader }, "k" },
		bottom_half = { { "ctrl", leader }, "j" },
		third_left = { { "ctrl", "alt" }, "h" },
		third_right = { { "ctrl", "alt" }, "l" },
		third_up = { { "ctrl", "alt" }, "k" },
		third_down = { { "ctrl", "alt" }, "j" },
		max_toggle = { { "ctrl", "alt", leader }, "f" },
		max = { { "ctrl", "alt", leader }, "k" },
		center = { { "alt", leader }, "c" },
		larger = { { "alt", leader, "shift" }, "l" },
		smaller = { { "alt", leader, "shift" }, "h" },

		top_left = { { "ctrl", leader }, "1" },
		top_right = { { "ctrl", leader }, "2" },
		bottom_left = { { "ctrl", leader }, "3" },
		bottom_right = { { "ctrl", leader }, "4" },
	},
})
