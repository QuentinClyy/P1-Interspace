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

	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyLoad",
		callback = function()
			local reapplied = theme.get(palette, config.options)
			util.set_highlights(reapplied)
		end,
	})

	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = function()
			if vim.g.colors_name == "verdigris" then
				local reapplied = theme.get(palette, config.options)
				util.set_highlights(reapplied)
			end
		end,
	})
end

M.palette = palette

return M
