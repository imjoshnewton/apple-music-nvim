-- Apple Music integration
local function playMusic(arg)
	local trackInfoCmd =
		'osascript -e "tell application \\"Music\\" to get artist of current track & \\" - \\" & name of current track"'

	-- Execute the command only if it's not 'current track'
	if arg ~= "current track" then
		local command = 'osascript -e "tell application \\"Music\\" to ' .. arg .. '"'
		-- print(command)
		vim.fn.system(command)
	end

	-- Fetch and display track info for 'next track', 'previous track', or 'current track'
	if arg == "next track" or arg == "previous track" or arg == "current track" then
		-- Add a small delay for 'next track' and 'previous track' to ensure the track has changed
		if arg ~= "current track" then
			vim.wait(300, function()
				return false
			end)
		end
		local trackInfo = vim.fn.system(trackInfoCmd)
		Snacks.notify(trackInfo, "info", { title = "Apple Music", icon = "󰝚", render = "wrapped-compact" })
		--print(trackInfo)
	end
end

local function toggle_mute()
	local apple_script = [[
    tell application "System Events"
        set currentVolume to get volume settings
        if output muted of currentVolume is false then
            set volume with output muted
            return "Muted 󰖁"
        else
            set volume without output muted
            return "Unmuted "
        end if
    end tell
    ]]

	local result = vim.fn.system("osascript -e '" .. apple_script .. "'")

	-- Display the result as a notification
	-- vim.notify("System volume is now: " .. result, "info")
	Snacks.notify(
		"System volume is now: " .. result,
		"info",
		{ title = "System", icon = "", render = "wrapped-compact" }
	)
end

return {
	playMusic = playMusic,
	toggle_mute = toggle_mute,
}
