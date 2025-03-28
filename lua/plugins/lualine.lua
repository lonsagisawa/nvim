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

		local function custom_mode()
			local mode_map = {
				n = "NOR", -- ノーマルモード
				i = "INS", -- インサートモード
				v = "VIS", -- ビジュアルモード
				V = "V-L", -- ビジュアルラインモード
				[""] = "V-B", -- ビジュアルブロックモード
				c = "COM", -- コマンドモード
				R = "REP", -- 置換モード
				t = "TER", -- ターミナルモード
			}

			local current_mode = vim.fn.mode()
			return mode_map[current_mode] or current_mode
		end

		require("lualine").setup({
			options = {
				theme = "catppuccin",
				section_separators = { left = "", right = "" },
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
				lualine_a = { { custom_mode, separator = { left = "", right = "" } } },
				lualine_b = {
					{ "b:gitsigns_head", icon = "" },
				},
				lualine_c = {
					{ "aerial", sep = "  " },
				},
				lualine_x = {
					{ "lsp_status", symbols = { spinner = { "" }, done = "", separator = "," } },
					"location",
				},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = {
				"lazy",
				"mason",
				"nvim-tree",
			},
			winbar = {
				lualine_x = {
					{
						"diff",
						source = diff_source,
						symbols = { added = " ", modified = " ", removed = " " },
					},
					"diagnostics",
				},
				lualine_z = {
					{
						"filetype",
						padding = { left = 1, right = 0 },
						colored = false,
						icon_only = true,
						separator = { left = "" },
					},
					{
						"filename",
						padding = { left = 0, right = 1 },
						symbols = { unnamed = " [No Name]" },
						separator = { left = "", right = "" },
					},
				},
			},
			inactive_winbar = {
				lualine_x = {
					{
						"diff",
						source = diff_source,
						symbols = { added = " ", modified = " ", removed = " " },
					},
					"diagnostics",
				},
				lualine_z = {
					{
						"filetype",
						padding = { left = 1, right = 0 },
						colored = false,
						icon_only = true,
						separator = { left = "" },
					},
					{
						"filename",
						padding = { left = 0, right = 1 },
						symbols = { unnamed = " [No Name]" },
						separator = { left = "", right = "" },
					},
				},
			},
		})
	end,
}
