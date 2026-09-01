return function(ctx)
  local p, float_bg = ctx.p, ctx.float_bg

  return {
    NoiceCmdlinePopup = { fg = p.text, bg = float_bg },
    NoiceCmdlinePopupBorder = { fg = p.border, bg = float_bg },
    NoiceCmdlinePopupBorderCmdline = { fg = p.border, bg = float_bg },
    NoiceCmdlinePopupTitleCmdline = { fg = p.base, bg = p.green },
  }
end
