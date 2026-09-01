return function(ctx)
  local p, float_bg = ctx.p, ctx.float_bg

  return {
    WhichKey = { fg = p.green },
    WhichKeyGroup = { fg = p.blue },
    WhichKeyDesc = { fg = p.text },
    WhichKeySeparator = { fg = p.overlay1 },
    WhichKeyFloat = { bg = float_bg },
    WhichKeyBorder = { fg = p.border, bg = float_bg },
  }
end
