return function(ctx)
  local p, float_bg = ctx.p, ctx.float_bg

  return {
    TelescopeNormal = { fg = p.text, bg = float_bg },
    TelescopeBorder = { fg = p.border, bg = float_bg },
    TelescopePromptNormal = { fg = p.text, bg = p.surface1 },
    TelescopePromptBorder = { fg = p.border, bg = p.surface1 },
    TelescopePromptTitle = { fg = p.base, bg = p.green },
    TelescopeResultsTitle = { fg = p.base, bg = p.green },
    TelescopePreviewTitle = { fg = p.base, bg = p.green },
    TelescopeSelection = { fg = p.text, bg = p.surface1 },
    TelescopeMatching = { fg = p.green, bold = true },
  }
end
