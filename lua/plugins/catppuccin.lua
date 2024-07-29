return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "macchiato",
		integrations = {
			noice = true,
		},
	},
	config = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}
