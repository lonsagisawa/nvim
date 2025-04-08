return {
	"nvim-lualine/lualine.nvim",
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

		local function component__avante_provider()
			local avante_config = require("avante.config")
			local provider_details = avante_config.get_provider_config(avante_config.provider)

			-- return avante_config.provider .. " - " .. provider_details.model
			return provider_details.model
		end

		require("lualine").setup({
			options = {
				theme = "catppuccin-mocha-custom",
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
						padding = 0,
					},
				},
				lualine_b = {
					{ "b:gitsigns_head", icon = "", padding = { left = 2, right = 1 } },
				},
				lualine_c = {
					{ "aerial", sep = "  " },
				},
				lualine_x = {
					{ "lsp_status", symbols = { spinner = { "" }, done = "", separator = "," } },
					{ component__avante_provider, icon = "󱚣" },
					{ require("mcphub.extensions.lualine") },
				},
				lualine_y = {
					{
						"diff",
						source = diff_source,
						symbols = { added = " ", modified = " ", removed = " " },
					},
					"diagnostics",
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
