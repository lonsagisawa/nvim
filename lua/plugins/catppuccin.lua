return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = true,
	priority = 1000,
	opts = {
		flavour = "mocha",
		integrations = {
			aerial = true,
			blink_cmp = true,
			flash = true,
			gitsigns = true,
			markdown = true,
			mason = true,
			mini = {
				enabled = true,
			},
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
			render_markdown = true,
			snacks = {
				enabled = true,
				indent_scope_color = "lavender",
			},
			treesitter_context = true,
			treesitter = true,
			which_key = true,
		},
		custom_highlights = function(colors)
			return {
				BlinkCmpMenuBorder = {
					bg = colors.base,
					fg = colors.mauve,
				},
			}
		end,
	},
}
