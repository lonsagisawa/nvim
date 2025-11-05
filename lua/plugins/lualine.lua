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
				globalstatus = true,
				disabled_filetypes = {
					statusline = {
						"snacks_dashboard",
					},
					winbar = {
						"no-neck-pain",
						"snacks_dashboard",
					},
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return string.sub(str, 1, 3)
						end,
					},
				},
				lualine_b = {
					"branch",
					{
						"diff",
						source = diff_source,
						symbols = { added = " ", modified = " ", removed = " " },
					},
					"diagnostics",
				},
				lualine_c = {
					"aerial",
				},
				lualine_x = {
				},
				lualine_y = {
					{
						function()
							local status = require("sidekick.status").cli()
							return " " .. (#status > 1 and #status or "")
						end,
						cond = function()
							return #require("sidekick.status").cli() > 0
						end,
						color = function()
							return "Special"
						end,
					}
				},
				lualine_z = {
					{ "location", icon = "" },
				},
			},
			extensions = {
				"lazy",
				"mason",
				"nvim-tree",
			},
		})
	end,
}
