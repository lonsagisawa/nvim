vim.pack.add({
	{
		src = "https://github.com/rose-pine/neovim",
		name = "rose-pine",
	},
})

require("rose-pine").setup({
	variant = "auto",
	dark_variant = "main",
	highlight_groups = {
		BlinkCmpMenu = {
			bg = "base",
			fg = "text",
		},
		BlinkCmpSource = {
			bg = "base",
			fg = "foam",
		},
		BlinkCmpMenuBorder = {
			bg = "base",
			fg = "iris",
		},
	},
})

-- set colorscheme
vim.cmd.colorscheme("rose-pine")
