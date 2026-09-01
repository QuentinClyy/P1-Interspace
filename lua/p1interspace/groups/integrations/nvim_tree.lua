return function(ctx)
  local p = ctx.p

  return {
    NvimTreeNormal = { fg = p.text, bg = p.mantle },
    NvimTreeNormalNC = { fg = p.text, bg = p.mantle },
    NvimTreeWinSeparator = { fg = p.border, bg = p.mantle },
    NvimTreeRootFolder = { fg = p.green, bold = true },
    NvimTreeFolderIcon = { fg = p.blue },
    NvimTreeFolderName = { fg = p.text },
    NvimTreeOpenedFolderName = { fg = p.green, bold = true },
    NvimTreeEmptyFolderName = { fg = p.overlay1 },
    NvimTreeIndentMarker = { fg = p.overlay0 },
    NvimTreeGitDirty = { fg = p.yellow },
    NvimTreeGitNew = { fg = p.green },
    NvimTreeGitDeleted = { fg = p.red },
    NvimTreeSpecialFile = { fg = p.sand, underline = true },
    NvimTreeExecFile = { fg = p.green },
    NvimTreeCursorLine = { bg = p.surface1 },
    NvimTreeStatuslineNc = { fg = p.mantle, bg = p.mantle },
  }
end
