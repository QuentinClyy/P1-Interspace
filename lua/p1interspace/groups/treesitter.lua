return function(ctx)
  local p = ctx.p

  return {
    ['@variable'] = { fg = p.text },
    ['@variable.builtin'] = { fg = p.peach, italic = true },
    ['@variable.parameter'] = { fg = p.lavender },
    ['@variable.member'] = { fg = p.teal },

    ['@function'] = { fg = p.green },
    ['@function.builtin'] = { fg = p.green, italic = true },
    ['@function.call'] = { fg = p.green },
    ['@method'] = { fg = p.green },
    ['@method.call'] = { fg = p.green },
    ['@constructor'] = { fg = p.purple },

    ['@keyword'] = { fg = p.blue },
    ['@keyword.function'] = { fg = p.blue },
    ['@keyword.return'] = { fg = p.blue },
    ['@keyword.operator'] = { fg = p.subtext0 },
    ['@conditional'] = { fg = p.blue },
    ['@repeat'] = { fg = p.blue },
    ['@exception'] = { fg = p.peach },

    ['@string'] = { fg = p.sand },
    ['@string.escape'] = { fg = p.peach },
    ['@number'] = { fg = p.coral },
    ['@boolean'] = { fg = p.coral },
    ['@float'] = { fg = p.coral },
    ['@character'] = { fg = p.sand },

    ['@type'] = { fg = p.lavender },
    ['@type.builtin'] = { fg = p.lavender, italic = true },
    ['@attribute'] = { fg = p.purple },
    ['@property'] = { fg = p.teal },

    ['@comment'] = { fg = p.overlay1, italic = true },
    ['@punctuation.delimiter'] = { fg = p.subtext0 },
    ['@punctuation.bracket'] = { fg = p.subtext0 },
    ['@tag'] = { fg = p.purple },
    ['@tag.attribute'] = { fg = p.lavender },
    ['@tag.delimiter'] = { fg = p.subtext0 },
  }
end
