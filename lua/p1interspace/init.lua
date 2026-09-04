local config = require("p1interspace.config")
local palette = require("p1interspace.palette")
local theme = require("p1interspace.theme")
local highlight = require("p1interspace.highlight")

local M = {}

M.setup = config.setup

function M.load()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "p1interspace"

	local opts = config.options
	local highlights = theme.get(palette, opts)
	highlight.set_highlights(highlights)

	vim.o.winblend = opts.popup_blend
	vim.o.pumblend = opts.popup_blend

	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyLoad",
		callback = function()
			local reapplied = theme.get(palette, config.options)
			highlight.set_highlights(reapplied)
		end,
	})

	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = function()
			if vim.g.colors_name == "p1interspace" then
				local reapplied = theme.get(palette, config.options)
				highlight.set_highlights(reapplied)
			end
		end,
	})
end

M.palette = palette

return M
