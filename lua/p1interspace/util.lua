local this_file = debug.getinfo(1, "S").source:sub(2)
local root = this_file:match("(.*)[/\\]lua[/\\]p1interspace[/\\]util%.lua$")
return dofile(root .. "/util.lua")
