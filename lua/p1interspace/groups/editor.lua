return function(ctx)
  local p, bg, float_bg = ctx.p, ctx.bg, ctx.float_bg

  return {
    Normal = { fg = p.text, bg = bg },
    NormalNC = { fg = p.text, bg = bg },
    NormalFloat = { fg = p.text, bg = float_bg },
    FloatBorder = { fg = p.border, bg = float_bg },
    FloatTitle = { fg = p.green, bg = float_bg },

    ColorColumn = { bg = p.surface0 },
    Cursor = { fg = p.base, bg = p.text },
    CursorLine = { bg = p.mantle },
    CursorLineNr = { fg = p.green, bold = true },
    LineNr = { fg = p.overlay1 },
    SignColumn = { bg = bg },

    VertSplit = { fg = p.border },
    WinSeparator = { fg = p.border },

    StatusLine = { fg = p.text, bg = p.surface0 },
    StatusLineNC = { fg = p.overlay1, bg = p.base },

    TabLine = { fg = p.overlay1, bg = p.base },
    TabLineFill = { bg = p.base },
    TabLineSel = { fg = p.green, bg = p.surface0 },

    Pmenu = { fg = p.text, bg = float_bg },
    PmenuSel = { fg = p.base, bg = p.green },
    PmenuSbar = { bg = p.surface1 },
    PmenuThumb = { bg = p.overlay1 },

    Search = { fg = p.text, bg = p.surface2 },
    IncSearch = { fg = p.base, bg = p.yellow },
    CurSearch = { fg = p.base, bg = p.yellow },

    Visual = { bg = p.select },
    VisualNOS = { bg = p.select },
    MatchParen = { fg = p.green, bold = true, underline = true },

    NonText = { fg = p.overlay0 },
    EndOfBuffer = { fg = p.base },
    Whitespace = { fg = p.overlay0 },

    DiagnosticError = { fg = p.red },
    DiagnosticWarn = { fg = p.yellow },
    DiagnosticInfo = { fg = p.sky },
    DiagnosticHint = { fg = p.teal },
    DiagnosticUnderlineError = { undercurl = true, sp = p.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = p.yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = p.sky },
    DiagnosticUnderlineHint = { undercurl = true, sp = p.teal },
    DiagnosticFloatingError = { fg = p.red, bg = float_bg },
    DiagnosticFloatingWarn = { fg = p.yellow, bg = float_bg },
    DiagnosticFloatingInfo = { fg = p.sky, bg = float_bg },
    DiagnosticFloatingHint = { fg = p.teal, bg = float_bg },

    DiffAdd = { fg = p.green, bg = p.none },
    DiffChange = { fg = p.yellow, bg = p.none },
    DiffDelete = { fg = p.red, bg = p.none },
    DiffText = { fg = p.text, bg = p.surface2 },

    SpellBad = { undercurl = true, sp = p.red },
    SpellCap = { undercurl = true, sp = p.yellow },
    SpellLocal = { undercurl = true, sp = p.teal },
    SpellRare = { undercurl = true, sp = p.purple },
  }
end
