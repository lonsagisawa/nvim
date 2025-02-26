return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- https://qiita.com/uhooi/items/99aeff822d4870a8e269
		local component__lsp_names = function()
			local clients = vim.iter(vim.lsp.get_clients({ bufnr = 0 }))
				:map(function(client)
					return client.name
				end)
				:totable()
			return " " .. table.concat(clients, ", ")
		end

		require("lualine").setup({
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
				lualine_b = { "branch", component__lsp_names },
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
					{ "aerial", sep = "  " },
				},
				lualine_z = {
					{ "filetype", padding = { left = 1, right = 0 }, icon_only = true },
					{ "filename", padding = { left = 0, right = 1 } },
				},
			},
			inactive_winbar = {
				lualine_b = {
					{ "aerial", sep = "  " },
				},
				lualine_z = {
					{ "filetype", padding = { left = 1, right = 0 }, icon_only = true },
					{ "filename", padding = { left = 0, right = 1 } },
				},
			},
		})
	end,
}
