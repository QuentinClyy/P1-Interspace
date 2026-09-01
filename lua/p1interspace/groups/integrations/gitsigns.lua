return function(ctx)
  local p = ctx.p

  return {
    GitSignsAdd = { fg = p.green },
    GitSignsChange = { fg = p.yellow },
    GitSignsDelete = { fg = p.red },
  }
end
