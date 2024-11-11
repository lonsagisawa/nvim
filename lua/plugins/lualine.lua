return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "catppuccin",
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = { "diff", "diagnostics" },
			lualine_x = {},
			lualine_y = { "filetype" },
			lualine_z = { "location" },
		},
		extensions = {
			"lazy",
			"mason",
			"neo-tree",
		},
	},
}
