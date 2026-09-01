return function(ctx)
  local p = ctx.p

  return {
    Comment = { fg = p.overlay1, italic = true },
    Constant = { fg = p.coral },
    String = { fg = p.sand },
    Character = { fg = p.sand },
    Number = { fg = p.coral },
    Boolean = { fg = p.coral },
    Float = { fg = p.coral },

    Identifier = { fg = p.text },
    Function = { fg = p.green },

    Statement = { fg = p.blue },
    Conditional = { fg = p.blue },
    Repeat = { fg = p.blue },
    Label = { fg = p.blue },
    Operator = { fg = p.subtext0 },
    Keyword = { fg = p.blue },
    Exception = { fg = p.peach },

    PreProc = { fg = p.purple },
    Include = { fg = p.blue },
    Define = { fg = p.mauve },
    Macro = { fg = p.mauve },
    PreCondit = { fg = p.purple },

    Type = { fg = p.lavender },
    StorageClass = { fg = p.purple },
    Structure = { fg = p.teal },
    Typedef = { fg = p.teal },

    Special = { fg = p.purple },
    SpecialChar = { fg = p.peach },
    Tag = { fg = p.purple },
    Delimiter = { fg = p.pink },
    SpecialComment = { fg = p.overlay2, italic = true },
    Debug = { fg = p.red },

    Underlined = { underline = true },
    Ignore = { fg = p.overlay0 },
    Error = { fg = p.red },
    Todo = { fg = p.base, bg = p.yellow, bold = true },
  }
end
