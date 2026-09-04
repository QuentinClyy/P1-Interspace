local M = {}

function M.set_highlights(highlights)
	for group, spec in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, spec)
	end
end

return M
