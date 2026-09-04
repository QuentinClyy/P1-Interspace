# P1 Interspace

A deep blue-green colorscheme for Neovim, with a matching tmux status line and WezTerm theme. Named after the P1 phosphor — the medium-persistence green coating used in classic CRT terminals and oscilloscopes — and the sense of being inside an interface.

## Installation

Using lazy.nvim:

```lua
return {
  "QuentinClyy/P1-Interspace",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require("p1interspace").setup(opts)
    vim.cmd.colorscheme("p1interspace")
  end,
}
```

## Configuration

Defaults shown below, pass any subset to `setup()`:

```lua
require("p1interspace").setup({
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
    snacks = true,
    fzf_lua = true,
    nvim_tree = true,
  },
})
```

`transparent` removes the background color from the editor entirely, letting your terminal's own background (including any transparency or blur your terminal emulator provides) show through.

`popup_blend` controls how see-through floating windows are (Telescope, LSP hover, completion menus, WhichKey) via Neovim's `winblend`/`pumblend`. `0` is fully opaque, higher values are more transparent relative to the content behind them.

## tmux

Copy `extras/tmux/p1interspace.conf` into your tmux config directory and source it from `~/.tmux.conf`:

```
source-file ~/.config/tmux/p1interspace.conf
```

To let your terminal's own transparency/blur show through the tmux status bar and panes instead of the solid background color, replace every `bg=#0c1917` in `p1interspace.conf` with `bg=default`.

## WezTerm

**Recommended: via WezTerm's plugin system.** WezTerm clones this repo into its own runtime directory automatically the first time it's referenced — no manual copy, no path to maintain:

```lua
local p1interspace = wezterm.plugin.require("https://github.com/QuentinClyy/P1-Interspace")
p1interspace.apply_to_config(config)
```

Update alongside other plugins with `wezterm.plugin.update_all()`. Requires HTTPS access to this repo (WezTerm's plugin loader doesn't support SSH remotes) — this repo is public, so no credentials needed.

**Alternative: manual copy.** If you'd rather not rely on the plugin mechanism, copy `extras/wezterm/p1interspace.toml` into WezTerm's color scheme directory instead:

```
mkdir -p ~/.config/wezterm/colors
cp extras/wezterm/p1interspace.toml ~/.config/wezterm/colors/
```

Then reference it by name in `wezterm.lua`:

```lua
config.color_scheme = "P1 Interspace"
```

Either way, the WezTerm palette is generated from the exact same hex values as the Neovim and tmux themes, so all three match.

## Structure

```
palette.lua                   -- shared color palette, repo root — required directly by
                                  nvim (via a thin re-export) AND WezTerm's plugin/init.lua
util.lua                      -- shared color math (blend/darken/lighten), repo root —
                                  pure Lua, no vim.* calls, so any Lua runtime can use it
lua/p1interspace/
  init.lua                    -- load() entry point, ColorScheme/LazyLoad reapply hooks
  config.lua                  -- setup(), integrations table
  palette.lua                 -- thin re-export of the root palette.lua (nvim plugin
                                  managers only scan a plugin's own lua/ directory, so
                                  this exists purely so require() still resolves)
  util.lua                    -- thin re-export of the root util.lua
  highlight.lua                -- the one genuinely nvim-specific piece: set_highlights(),
                                  which calls vim.api.nvim_set_hl — kept separate from the
                                  root util.lua so that file stays honestly tool-agnostic
  theme.lua                    -- merges editor/syntax/treesitter + enabled integrations
  groups/
    editor.lua                -- windows, cursor, statusline, popup, search, diagnostics, diff, spell
    syntax.lua                -- legacy (non-treesitter) vim syntax groups
    treesitter.lua            -- @capture groups, gated behind integrations.treesitter
    integrations/
      telescope.lua
      which_key.lua
      gitsigns.lua
      cmp.lua
      blink.lua
      snacks.lua
      nvim_tree.lua
      fzf_lua.lua
      noice.lua
colors/p1interspace.lua       -- standard :colorscheme entry point
plugin/init.lua               -- WezTerm plugin entry point (apply_to_config) — reads
                                  palette.lua/util.lua straight from the repo root
extras/
  tmux/p1interspace.conf
  wezterm/p1interspace.toml   -- manual-install alternative to the plugin mechanism above
  starship/starship.toml
```

**Why palette.lua and util.lua live at the repo root, not inside `lua/`:** this is a theme
repo first, with nvim/WezTerm/tmux/starship as integrations on top of it — not an nvim plugin
that happens to also support other tools. nvim and WezTerm both run real Lua, so they share
the root files directly (nvim through a one-line re-export, since its plugin manager only
discovers `lua/`/`colors/` at a repo's root — that constraint is real and can't be configured
around). tmux and starship can't `require` Lua at all, so `extras/tmux/p1interspace.conf` and
`extras/starship/starship.toml` are hand-maintained against the same root palette rather than
dynamically reading it — keep them in sync manually if the palette changes.

Each integration file is `function(ctx) -> table of highlight groups`, only required and merged into the final highlight table when its `config.integrations.<name>` flag is `true` — same pattern catppuccin uses for its own `groups/integrations/*.lua`, rather than one large file with an if-block per plugin.

Fixed while restructuring: `integrations.treesitter` existed as a config option before but was never actually checked — treesitter `@capture` groups were applied unconditionally regardless of the setting. `theme.lua` now gates them correctly.

## License

MIT
