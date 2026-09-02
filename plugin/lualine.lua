local later = function(f)
	require("mini.misc").safely("later", f)
end

vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

later(function()
	require("lualine").setup({
		options = {
			globalstatus = true,
			component_separators = "",
			section_separators = "",
		},
		sections = {
			lualine_a = {
				{
					"mode",
					fmt = function(str)
						return str:sub(1, 3)
					end,
				},
			},
			lualine_b = {},
			lualine_c = { "aerial" },
			lualine_x = {
				require("ddev.lualine").lualine_component,
				"branch",
				"diff",
				"diagnostics",
				"location",
			},
			lualine_y = {},
			lualine_z = {},
		},
		extensions = {
			"aerial",
		},
	})
end)
