local M = {}

local function hex_to_rgb(hex)
	hex = hex:gsub("#", "")
	return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

local function rgb_to_hex(r, g, b)
	return string.format("#%02x%02x%02x", math.floor(r), math.floor(g), math.floor(b))
end

function M.blend(fg, bg, alpha)
	local fr, fg_, fb = hex_to_rgb(fg)
	local br, bgg, bb = hex_to_rgb(bg)
	local r = (alpha * fr) + ((1 - alpha) * br)
	local g = (alpha * fg_) + ((1 - alpha) * bgg)
	local b = (alpha * fb) + ((1 - alpha) * bb)
	return rgb_to_hex(r, g, b)
end

function M.darken(hex, amount)
	return M.blend(hex, "#000000", 1 - amount)
end

function M.lighten(hex, amount)
	return M.blend(hex, "#ffffff", 1 - amount)
end

return M
