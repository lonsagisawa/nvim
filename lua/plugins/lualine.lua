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
				},
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = {
				{ "filetype", icon_only = true, padding = { left = 2, right = 0 } },
				{ "filename", padding = 0 },
			},
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
			lualine_z = {
				{ "filetype", padding = { left = 1, right = 0 }, icon_only = true },
				{ "filename", padding = { left = 0, right = 1 } },
			},
		},
		inactive_winbar = {
			lualine_z = {
				{ "filetype", padding = { left = 1, right = 0 }, icon_only = true },
				{ "filename", padding = { left = 0, right = 1 } },
			},
		},
	},
}
