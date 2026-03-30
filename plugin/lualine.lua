local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

later(function()
	require("lualine").setup({
		options = {
			globalstatus = true,
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
			lualine_b = {
				"branch",
				"diff",
				"diagnostics",
			},
			lualine_c = { "aerial" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {
				"location",
			},
		},
		extensions = {
			"aerial",
		},
	})
end)
