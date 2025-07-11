return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"stevearc/aerial.nvim",
	},
	config = function()
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
				theme = "catppuccin-mocha-custom",
				section_separators = "",
				component_separators = "",
				globalstatus = true,
				disabled_filetypes = {
					statusline = {
						"snacks_dashboard",
					},
					winbar = {
						"no-neck-pain",
						"snacks_dashboard",
						"Avante",
						"AvanteSelectedFiles",
						"AvanteInput",
					},
				},
			},
			sections = {
				lualine_a = {
					{
						function()
							return "█"
						end,
						padding = { left = 0, right = 1 },
					},
					{
						"mode",
						fmt = function(str)
							return string.sub(str, 1, 3)
						end,
						padding = { left = 0, right = 1 },
					},
				},
				lualine_b = {
					{
						"diff",
						source = diff_source,
						symbols = { added = " ", modified = " ", removed = " " },
					},
					"diagnostics",
				},
				lualine_c = {
				},
				lualine_x = {
				},
				lualine_y = {
				},
				lualine_z = {
					{ "location", icon = "" },
					{
						function()
							return "█"
						end,
						padding = 0,
					},
				},
			},
			extensions = {
				"lazy",
				"mason",
				"nvim-tree",
			},
			winbar = {
				lualine_c = {
					{ "aerial", sep = " › " },
				},
				lualine_z = {
					{
						"filetype",
						padding = { left = 1, right = 0 },
						colored = false,
						icon_only = true,
					},
					{
						"filename",
						padding = { left = 0, right = 1 },
						symbols = { unnamed = " [No Name]", modified = "" },
					},
					{
						function()
							return "█"
						end,
						padding = 0,
					},
				},
			},
			inactive_winbar = {
				lualine_z = {
					{
						"filetype",
						padding = { left = 1, right = 0 },
						colored = false,
						icon_only = true,
					},
					{
						"filename",
						padding = { left = 0, right = 1 },
						symbols = { unnamed = " [No Name]", modified = "" },
					},
					{
						function()
							return "█"
						end,
						padding = 0,
					},
				},
			},
		})
	end,
}
