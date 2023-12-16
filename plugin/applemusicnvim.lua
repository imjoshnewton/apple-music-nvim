-- Require the Lua modules
local appleMusic = require("apple_music")
local telescopeIntegration = require("telescope_integration")

-- Define Vim commands
vim.api.nvim_create_user_command("Music", function(input)
	appleMusic.playMusic(input.args)
end, { nargs = 1 })

-- Define key mappings with descriptions
vim.keymap.set("n", "<leader>mP", ":Music playpause<CR>", { noremap = true, silent = true, desc = "Play/Pause Music" })
vim.keymap.set("n", "<leader>mn", ":Music next track<CR>", { noremap = true, silent = true, desc = "Next Track" })
vim.keymap.set(
	"n",
	"<leader>mp",
	":Music previous track<CR>",
	{ noremap = true, silent = true, desc = "Previous Track" }
)
vim.keymap.set("n", "<leader>mc", ":Music current track<CR>", { noremap = true, silent = true, desc = "Current Track" })
vim.keymap.set(
	"n",
	"<leader>ml",
	telescopeIntegration.browse_playlists,
	{ noremap = true, silent = true, desc = "Browse Playlists" }
)
vim.keymap.set("n", "<leader>mm", appleMusic.toggle_mute, { noremap = true, silent = true, desc = "Toggle Mute" })
