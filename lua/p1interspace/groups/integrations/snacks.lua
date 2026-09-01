return function(ctx)
  local p, float_bg = ctx.p, ctx.float_bg

  return {
    SnacksNormal = { fg = p.text, bg = float_bg },
    SnacksNormalNC = { fg = p.text, bg = float_bg },
    SnacksBorder = { fg = p.border, bg = float_bg },
    SnacksBackdrop = { bg = p.crust },
    SnacksPicker = { fg = p.text, bg = float_bg },
    SnacksPickerBorder = { fg = p.border, bg = float_bg },
    SnacksPickerTitle = { fg = p.base, bg = p.green },
    SnacksPickerBoxTitle = { fg = p.base, bg = p.green },
    SnacksPickerInputTitle = { fg = p.base, bg = p.green },
    SnacksPickerPreviewTitle = { fg = p.base, bg = p.green },
    SnacksPickerMatch = { fg = p.green, bold = true },
    SnacksPickerDir = { fg = p.overlay1 },
    SnacksPickerFile = { fg = p.text },
    SnacksPickerListCursorLine = { bg = p.surface1 },
  }
end
