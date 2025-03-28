local C = require("catppuccin.palettes").get_palette("mocha")
local O = require("catppuccin").options
local catppuccin = {}

local transparent_bg = O.transparent_background and "NONE" or C.mantle

catppuccin.normal = {
	a = { bg = transparent_bg, fg = C.blue, gui = "bold" },
	b = { bg = transparent_bg, fg = C.blue },
	c = { bg = transparent_bg, fg = C.text },
}

catppuccin.insert = {
	a = { bg = transparent_bg, fg = C.green, gui = "bold" },
	b = { bg = transparent_bg, fg = C.green },
}

catppuccin.terminal = {
	a = { bg = transparent_bg, fg = C.green, gui = "bold" },
	b = { bg = transparent_bg, fg = C.green },
}

catppuccin.command = {
	a = { bg = transparent_bg, fg = C.peach, gui = "bold" },
	b = { bg = transparent_bg, fg = C.peach },
}

catppuccin.visual = {
	a = { bg = transparent_bg, fg = C.mauve, gui = "bold" },
	b = { bg = transparent_bg, fg = C.mauve },
}

catppuccin.replace = {
	a = { bg = transparent_bg, fg = C.red, gui = "bold" },
	b = { bg = transparent_bg, fg = C.red },
}

catppuccin.inactive = {
	a = { bg = transparent_bg, fg = C.overlay1 },
	b = { bg = transparent_bg, fg = C.surface1, gui = "bold" },
	c = { bg = transparent_bg, fg = C.overlay0 },
}

return catppuccin
