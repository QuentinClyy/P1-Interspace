local M = {}

function M.get(p, opts)
	local bg = opts.transparent and p.none or p.base
	local float_bg = p.surface0

	local groups = {
		Normal = { fg = p.text, bg = bg },
		NormalNC = { fg = p.text, bg = bg },
		NormalFloat = { fg = p.text, bg = float_bg },
		FloatBorder = { fg = p.border, bg = float_bg },
		FloatTitle = { fg = p.green, bg = float_bg },

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

		Visual = { bg = p.surface1 },
		VisualNOS = { bg = p.surface1 },
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

		["@variable"] = { fg = p.text },
		["@variable.builtin"] = { fg = p.peach, italic = true },
		["@variable.parameter"] = { fg = p.lavender },
		["@variable.member"] = { fg = p.teal },

		["@function"] = { fg = p.green },
		["@function.builtin"] = { fg = p.green, italic = true },
		["@function.call"] = { fg = p.green },
		["@method"] = { fg = p.green },
		["@method.call"] = { fg = p.green },
		["@constructor"] = { fg = p.purple },

		["@keyword"] = { fg = p.blue },
		["@keyword.function"] = { fg = p.blue },
		["@keyword.return"] = { fg = p.blue },
		["@keyword.operator"] = { fg = p.subtext0 },
		["@conditional"] = { fg = p.blue },
		["@repeat"] = { fg = p.blue },
		["@exception"] = { fg = p.peach },

		["@string"] = { fg = p.sand },
		["@string.escape"] = { fg = p.peach },
		["@number"] = { fg = p.coral },
		["@boolean"] = { fg = p.coral },
		["@float"] = { fg = p.coral },
		["@character"] = { fg = p.sand },

		["@type"] = { fg = p.lavender },
		["@type.builtin"] = { fg = p.lavender, italic = true },
		["@attribute"] = { fg = p.purple },
		["@property"] = { fg = p.teal },

		["@comment"] = { fg = p.overlay1, italic = true },
		["@punctuation.delimiter"] = { fg = p.subtext0 },
		["@punctuation.bracket"] = { fg = p.subtext0 },
		["@tag"] = { fg = p.purple },
		["@tag.attribute"] = { fg = p.lavender },
		["@tag.delimiter"] = { fg = p.subtext0 },
	}

	if opts.integrations.telescope then
		groups.TelescopeNormal = { fg = p.text, bg = float_bg }
		groups.TelescopeBorder = { fg = p.border, bg = float_bg }
		groups.TelescopePromptNormal = { fg = p.text, bg = p.surface1 }
		groups.TelescopePromptBorder = { fg = p.border, bg = p.surface1 }
		groups.TelescopePromptTitle = { fg = p.base, bg = p.green }
		groups.TelescopeResultsTitle = { fg = p.base, bg = p.green }
		groups.TelescopePreviewTitle = { fg = p.base, bg = p.green }
		groups.TelescopeSelection = { fg = p.text, bg = p.surface1 }
		groups.TelescopeMatching = { fg = p.green, bold = true }
	end

	if opts.integrations.which_key then
		groups.WhichKey = { fg = p.green }
		groups.WhichKeyGroup = { fg = p.blue }
		groups.WhichKeyDesc = { fg = p.text }
		groups.WhichKeySeparator = { fg = p.overlay1 }
		groups.WhichKeyFloat = { bg = float_bg }
		groups.WhichKeyBorder = { fg = p.border, bg = float_bg }
	end

	if opts.integrations.gitsigns then
		groups.GitSignsAdd = { fg = p.green }
		groups.GitSignsChange = { fg = p.yellow }
		groups.GitSignsDelete = { fg = p.red }
	end

	if opts.integrations.cmp then
		groups.CmpItemAbbr = { fg = p.text }
		groups.CmpItemAbbrMatch = { fg = p.green, bold = true }
		groups.CmpItemKind = { fg = p.purple }
		groups.CmpItemMenu = { fg = p.overlay1 }
	end

	if opts.integrations.blink then
		groups.BlinkCmpMenu = { fg = p.text, bg = float_bg }
		groups.BlinkCmpMenuBorder = { fg = p.border, bg = float_bg }
		groups.BlinkCmpLabelMatch = { fg = p.green, bold = true }
		groups.BlinkCmpKind = { fg = p.purple }
	end

	if opts.integrations.snacks then
		groups.SnacksNormal = { fg = p.text, bg = float_bg }
		groups.SnacksNormalNC = { fg = p.text, bg = float_bg }
		groups.SnacksBorder = { fg = p.border, bg = float_bg }
		groups.SnacksBackdrop = { bg = p.crust }
		groups.SnacksPicker = { fg = p.text, bg = float_bg }
		groups.SnacksPickerBorder = { fg = p.border, bg = float_bg }
		groups.SnacksPickerTitle = { fg = p.base, bg = p.green }
		groups.SnacksPickerBoxTitle = { fg = p.base, bg = p.green }
		groups.SnacksPickerInputTitle = { fg = p.base, bg = p.green }
		groups.SnacksPickerPreviewTitle = { fg = p.base, bg = p.green }
		groups.SnacksPickerMatch = { fg = p.green, bold = true }
		groups.SnacksPickerDir = { fg = p.overlay1 }
		groups.SnacksPickerFile = { fg = p.text }
		groups.SnacksPickerListCursorLine = { bg = p.surface1 }
	end

	if opts.integrations.noice then
		groups.NoiceCmdlinePopup = { fg = p.text, bg = float_bg }
		groups.NoiceCmdlinePopupBorder = { fg = p.border, bg = float_bg }
	end

	return groups
end

return M
