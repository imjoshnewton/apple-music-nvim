lua local appleMusic = require("apple_music")
lua local telescopeIntegration = require("telescope_integration")

command! -nargs=1 Music lua appleMusic.playMusic(<f-args>)

nnoremap <leader>mP :Music playpause<CR>
nnoremap <leader>mn :Music next track<CR>
nnoremap <leader>mp :Music previous track<CR>
nnoremap <leader>mc :Music current track<CR>
nnoremap <leader>ml :lua telescopeIntegration.browse_playlists()<CR>
nnoremap <leader>mm :lua appleMusic.toggle_mute()<CR>

