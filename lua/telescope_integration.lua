local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")

local function browse_playlists()
	local apple_script = [[
tell application "Music"
    set playlistList to "["
    set allPlaylists to every playlist
    repeat with aPlaylist in allPlaylists
        if length of playlistList > 1 then
            set playlistList to playlistList & ", "
        end if
        set playlistList to playlistList & "\"" & (name of aPlaylist) & "\""
    end repeat
    set playlistList to playlistList & "]"
end tell

return playlistList
    ]]

	local playlists = vim.fn.system("osascript -e '" .. apple_script .. "'")
	-- print(playlists)
	local trimmed = playlists:sub(3, -4)
	local results = vim.split(trimmed, '", "')

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Playlists",
			finder = require("telescope.finders").new_table({
				results = results,
			}),
			sorter = require("telescope.config").values.generic_sorter({}),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)
					-- Construct and send the play playlist command
					local play_command = 'play playlist \\"' .. selection.value .. '\\"'
					vim.cmd("Music " .. play_command)
				end)
				return true
			end,
		})
		:find()
end

return {
	browse_playlists = browse_playlists,
}
