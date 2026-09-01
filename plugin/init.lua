local M = {}

local colors = {
  foreground = '#9fc9bd',
  background = '#0a171a',
  cursor_bg = '#9fc9bd',
  cursor_fg = '#0a171a',
  cursor_border = '#9fc9bd',
  selection_fg = '#9fc9bd',
  selection_bg = '#466366',
  split = '#24413c',
  ansi = { '#172b31', '#e0667a', '#4fd8b0', '#e0b563', '#5da9d9', '#9a93d9', '#6fc9bf', '#9fc9bd' },
  brights = { '#46615c', '#e68292', '#6fdfbe', '#d9b877', '#63b3e0', '#8fa8d9', '#89d3cb', '#c1dcd4' },
  tab_bar = {
    background = '#0a171a',
    active_tab = { bg_color = '#132329', fg_color = '#4fd8b0', intensity = 'Bold' },
    inactive_tab = { bg_color = '#0a171a', fg_color = '#46615c' },
    inactive_tab_hover = { bg_color = '#172b31', fg_color = '#9fc9bd' },
    new_tab = { bg_color = '#0a171a', fg_color = '#46615c' },
    new_tab_hover = { bg_color = '#172b31', fg_color = '#4fd8b0' },
  },
}

-- config: a wezterm.config_builder() result, per the plugin API contract.
function M.apply_to_config(config)
  config.colors = colors
end

return M
