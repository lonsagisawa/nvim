return {
	"saghen/blink.cmp",

	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"saghen/blink.compat",
			lazy = true,
			opts = {},
		},
		"xzbdmw/colorful-menu.nvim",
	},

	version = "*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "enter" },

		appearance = {
			nerd_font_variant = "normal",
		},

		cmdline = {
			enabled = false,
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer", "avante_commands", "avante_mentions", "avante_files" },

			providers = {
				avante_commands = {
					name = "avante_commands",
					module = "blink.compat.source",
					score_offset = 90, -- show at a higher priority than lsp
					opts = {},
				},

				avante_files = {
					name = "avante_files",
					module = "blink.compat.source",
					score_offset = 100, -- show at a higher priority than lsp
					opts = {},
				},

				avante_mentions = {
					name = "avante_mentions",
					module = "blink.compat.source",
					score_offset = 1000, -- show at a higher priority than lsp
					opts = {},
				},
			},
		},

		completion = {
			menu = {
				auto_show = true,

				draw = {
					columns = {
						{ "kind_icon" },
						{ "label",    gap = 1 },
					},

					gap = 2,

					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						}
					},
				},

				border = "rounded",
				winhighlight = "Normal:Normal,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 300,
				window = {
					border = "rounded",
					winhighlight = "Normal:Normal,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
				},
			},

			ghost_text = {
				enabled = false,
			},
		},

		signature = {
			enabled = true,
			window = {
				show_documentation = false,
			},
		},
	},
	opts_extend = { "sources.default" },
}
