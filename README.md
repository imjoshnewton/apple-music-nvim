# applemusicnvim

Control Apple Music and manage playlists directly from Neovim with `applemusicnvim`, a Lua plugin that integrates Apple Music functionality into your favorite editor.

## Features

- **Play/Pause Music**: Control music playback in Apple Music.
- **Next/Previous Track**: Easily skip to the next or previous track.
- **Display Current Track**: Get the current track information.
- **Browse Playlists**: View and select from your Apple Music playlists using Telescope integration.
- **Toggle Mute**: Mute and unmute your system volume.

## Installation

### Using lazy.nvim

If you are using [lazy.nvim](https://github.com/folke/lazy.nvim), add the following to your Neovim configuration:

```lua
{
  'imjoshnewton/applemusicnvim',
  dependencies = { {'nvim-telescope/telescope.nvim'} }
}
```

### Using packer.nvim

If you are using [packer.nvim](https://github.com/wbthomason/packer.nvim), add the following to your Neovim configuration:

```lua
use {
  'imjoshnewton/applemusicnvim',
  requires = { {'nvim-telescope/telescope.nvim'} }
}
```

### Using vim-plug

If you are using [vim-plug](https://github.com/junegunn/vim-plug), add the following to your Neovim configuration:

```vim
Plug 'imjoshnewton/applemusicnvim'
Plug 'nvim-telescope/telescope.nvim'
```

Then run `:PlugInstall`.

## Usage

After installing the plugin, you can use the following commands:

- `:Music playpause` - Toggle play/pause.
- `:Music next track` - Play the next track.
- `:Music previous track` - Play the previous track.
- `:Music current track` - Show the current track.
- `:TelescopePlaylists` - Open a Telescope picker to browse and select playlists.
- `:ToggleMute` - Toggle system mute.

Key mappings are also provided for convenience (customizable in your Neovim configuration):

- `<leader>mP` - Toggle play/pause.
- `<leader>mn` - Next track.
- `<leader>mp` - Previous track.
- `<leader>mc` - Current track.
- `<leader>ml` - Browse playlists.
- `<leader>mm` - Toggle mute.

## Customization

To customize key mappings, you can override them in your Neovim configuration file.

## Contributing

Contributions to `applemusicnvim` are welcome! Please create an issue or submit a pull request.

## License

Distributed under the MIT License. See `LICENSE` for more information.
