# verdigris.nvim

A deep blue-green colorscheme for Neovim, with a matching tmux status line.

## Installation

Using lazy.nvim:

```lua
return {
  "QuentinClyy/verdigris.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require("verdigris").setup(opts)
    vim.cmd.colorscheme("verdigris")
  end,
}
```

## Configuration

Defaults shown below, pass any subset to `setup()`:

```lua
require("verdigris").setup({
  transparent = false,
  popup_blend = 15,
  integrations = {
    telescope = true,
    which_key = true,
    gitsigns = true,
    cmp = true,
    blink = true,
    noice = true,
    treesitter = true,
  },
})
```

`transparent` removes the background color from the editor entirely, letting your terminal's own background (including any transparency or blur your terminal emulator provides) show through.

`popup_blend` controls how see-through floating windows are (Telescope, LSP hover, completion menus, WhichKey) via Neovim's `winblend`/`pumblend`. `0` is fully opaque, higher values are more transparent relative to the content behind them.

## tmux

Copy `extras/tmux/verdigris.conf` into your tmux config directory and source it from `~/.tmux.conf`:

```
source-file ~/.config/tmux/verdigris.conf
```

To let your terminal's own transparency/blur show through the tmux status bar and panes instead of the solid background color, replace every `bg=#0c1917` in `verdigris.conf` with `bg=default`.

## License

MIT
