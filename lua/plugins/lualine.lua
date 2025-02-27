return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
	},
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

		local function diff_source()
			local gitsigns = vim.b.gitsigns_status_dict
			if gitsigns then
				return {
					added = gitsigns.added,
					modified = gitsigns.changed,
					removed = gitsigns.removed,
				}
			end
		end

		require("lualine").setup({
			options = {
				theme = "catppuccin",
				section_separators = "",
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
				lualine_b = { { "b:gitsigns_head", icon = "" }, component__lsp_names },
				lualine_c = {},
				lualine_x = {},
				lualine_y = { { "diff", source = diff_source }, "diagnostics" },
				lualine_z = { "location", "progress" },
			},
			extensions = {
				"lazy",
				"mason",
				"nvim-tree",
			},
			winbar = {
				lualine_c = {
					{ "aerial", sep = "  " },
				},
				lualine_z = {
					{ "filetype", padding = { left = 1, right = 0 }, icon_only = true },
					{ "filename", padding = { left = 0, right = 1 } },
				},
			},
			inactive_winbar = {
				lualine_c = {
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
