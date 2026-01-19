MiniDeps.add({ source = "catppuccin/nvim", name = "catppuccin" })

require("catppuccin").setup({
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
			BlinkCmpMenu = {
				bg = colors.base,
				fg = colors.text,
			},
			BlinkCmpSource = {
				bg = colors.base,
				fg = colors.blue,
			},
			BlinkCmpMenuBorder = {
				bg = colors.base,
				fg = colors.mauve,
			},
			MiniStatuslineDevInfo = {
				bg = colors.surface0,
				fg = colors.blue,
			},
			MiniStatuslineFileInfo = {
				bg = colors.surface0,
				fg = colors.blue,
			},
			InclineNormal = {
				bg = colors.blue,
				fg = colors.base,
			},
			InclineNormalNC = {
				bg = colors.mantle,
				fg = colors.overlay0,
			},
		}
	end,
})
