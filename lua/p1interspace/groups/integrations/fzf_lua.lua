return function(ctx)
  local p, float_bg = ctx.p, ctx.float_bg

  return {
    FzfLuaNormal = { fg = p.text, bg = float_bg },
    FzfLuaBorder = { fg = p.border, bg = float_bg },
    FzfLuaPreviewNormal = { fg = p.text, bg = float_bg },
    FzfLuaPreviewBorder = { fg = p.border, bg = float_bg },
    FzfLuaCursorLine = { bg = p.surface1 },
    FzfLuaCursorLineNr = { fg = p.green, bold = true },
    FzfLuaScrollBorderBackCompat = { fg = p.border, bg = float_bg },
    FzfLuaScrollFloatBackCompat = { bg = p.surface1 },
    FzfLuaTitle = { fg = p.base, bg = p.green },
    FzfLuaHeaderText = { fg = p.blue },
    FzfLuaHeaderBind = { fg = p.overlay1 },
  }
end
