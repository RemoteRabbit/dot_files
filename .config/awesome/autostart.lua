autorun = true

autorunApps = {}

if autorun then
	for app = 1, #autorunApps do
		awful.util.spawn(autorunApps[app])
	end
end
