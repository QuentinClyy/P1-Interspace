return function(ctx)
  local p = ctx.p

  return {
    CmpItemAbbr = { fg = p.text },
    CmpItemAbbrMatch = { fg = p.green, bold = true },
    CmpItemKind = { fg = p.purple },
    CmpItemMenu = { fg = p.overlay1 },
  }
end
