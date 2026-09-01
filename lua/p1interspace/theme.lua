local M = {}

local INTEGRATIONS = {
  telescope = 'p1interspace.groups.integrations.telescope',
  which_key = 'p1interspace.groups.integrations.which_key',
  gitsigns = 'p1interspace.groups.integrations.gitsigns',
  cmp = 'p1interspace.groups.integrations.cmp',
  blink = 'p1interspace.groups.integrations.blink',
  snacks = 'p1interspace.groups.integrations.snacks',
  nvim_tree = 'p1interspace.groups.integrations.nvim_tree',
  fzf_lua = 'p1interspace.groups.integrations.fzf_lua',
  noice = 'p1interspace.groups.integrations.noice',
}

function M.get(p, opts)
  local ctx = {
    p = p,
    bg = opts.transparent and p.none or p.base,
    float_bg = p.surface0,
  }

  local groups = {}
  groups = vim.tbl_extend('force', groups, require('p1interspace.groups.editor')(ctx))
  groups = vim.tbl_extend('force', groups, require('p1interspace.groups.syntax')(ctx))

  if opts.integrations.treesitter then
    groups = vim.tbl_extend('force', groups, require('p1interspace.groups.treesitter')(ctx))
  end

  for name, mod_path in pairs(INTEGRATIONS) do
    if opts.integrations[name] then
      groups = vim.tbl_extend('force', groups, require(mod_path)(ctx))
    end
  end

  return groups
end

return M
