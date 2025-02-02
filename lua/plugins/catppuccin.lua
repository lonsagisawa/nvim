return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "macchiato",
		integrations = {
			cmp = true,
			dashboard = true,
			flash = true,
			gitsigns = true,
			markdown = true,
			mason = true,
			mini = {
				enabled = true,
			},
			neotree = true,
			noice = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
					ok = { "italic" },
				},
				underlines = {
					errors = { "undercurl" },
					hints = { "underdouble" },
					warnings = { "underline" },
					information = { "underline" },
					ok = { "underline" },
				},
				inlay_hints = {
					background = true,
				},
			},
			notify = true,
			treesitter_context = true,
			treesitter = true,
			telescope = {
				enabled = true,
			},
			which_key = true,
		},
	},
}
