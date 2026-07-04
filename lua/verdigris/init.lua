local config = require("verdigris.config")
local palette = require("verdigris.palette")
local theme = require("verdigris.theme")
local util = require("verdigris.util")

local M = {}

M.setup = config.setup

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "verdigris"

  local opts = config.options
  local highlights = theme.get(palette, opts)
  util.set_highlights(highlights)

  vim.o.winblend = opts.popup_blend
  vim.o.pumblend = opts.popup_blend
end

M.palette = palette

return M
