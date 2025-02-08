return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "catppuccin",
			section_separators = {
				left = "",
				right = "",
			},
			component_separators = "",
			globalstatus = true,
			disabled_filetypes = {
				winbar = {
					"NvimTree",
					"no-neck-pain",
				},
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = { "diff", "diagnostics" },
			lualine_z = { "location", "progress" },
		},
		extensions = {
			"lazy",
			"mason",
			"nvim-tree",
		},
		winbar = {
			lualine_b = {
				"navic",
			},
			lualine_z = {
				{ "filetype", padding = { left = 1, right = 0 }, icon_only = true },
				{ "filename", padding = { left = 0, right = 1 } },
			},
		},
		inactive_winbar = {
			lualine_b = {
				"navic",
			},
			lualine_z = {
				{ "filetype", padding = { left = 1, right = 0 }, icon_only = true },
				{ "filename", padding = { left = 0, right = 1 } },
			},
		},
	},
}
