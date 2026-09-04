local wezterm = require("wezterm")

local function resolve_plugin_dir()
	for _, plugin in ipairs(wezterm.plugin.list()) do
		if plugin.url == "https://github.com/QuentinClyy/P1-Interspace" then
			return plugin.plugin_dir
		end
	end
end

local M = {}

function M.apply_to_config(config)
	local plugin_dir = resolve_plugin_dir()
	if not plugin_dir then
		wezterm.log_error("P1-Interspace: could not resolve plugin directory")
		return
	end

	local sep = package.config:sub(1, 1) == "\\" and "\\" or "/"
	local palette = dofile(plugin_dir .. sep .. "palette.lua")
	local util = dofile(plugin_dir .. sep .. "util.lua")

	config.colors = {
		foreground = palette.text,
		background = palette.base,
		cursor_bg = palette.text,
		cursor_fg = palette.base,
		cursor_border = palette.text,
		selection_fg = palette.text,
		selection_bg = palette.select,
		split = palette.border,
		ansi = {
			palette.surface1,
			palette.red,
			palette.green,
			palette.yellow,
			palette.blue,
			palette.purple,
			palette.teal,
			palette.text,
		},
		brights = {
			palette.overlay1,
			util.lighten(palette.red, 0.18),
			util.lighten(palette.green, 0.18),
			palette.sand,
			palette.sky,
			palette.lavender,
			util.lighten(palette.teal, 0.18),
			util.lighten(palette.text, 0.35),
		},
		tab_bar = {
			background = palette.base,
			active_tab = { bg_color = palette.surface0, fg_color = palette.green, intensity = "Bold" },
			inactive_tab = { bg_color = palette.base, fg_color = palette.overlay1 },
			inactive_tab_hover = { bg_color = palette.surface1, fg_color = palette.text },
			new_tab = { bg_color = palette.base, fg_color = palette.overlay1 },
			new_tab_hover = { bg_color = palette.surface1, fg_color = palette.green },
		},
	}
end

return M
