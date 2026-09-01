return function(ctx)
  local p, float_bg = ctx.p, ctx.float_bg

  return {
    BlinkCmpMenu = { fg = p.text, bg = float_bg },
    BlinkCmpMenuBorder = { fg = p.border, bg = float_bg },
    BlinkCmpLabelMatch = { fg = p.green, bold = true },
    BlinkCmpKind = { fg = p.purple },
  }
end
