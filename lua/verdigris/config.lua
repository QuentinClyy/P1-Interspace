local M = {}

M.defaults = {
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
	},
}

M.options = vim.deepcopy(M.defaults)

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), opts or {})
end

return M
