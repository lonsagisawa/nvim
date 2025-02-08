return {
	"saghen/blink.cmp",

	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"saghen/blink.compat",
			lazy = true,
			opts = {},
		},
	},

	version = "*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		enabled = function()
			return vim.bo.buftype == "" and vim.fn.expand("%:p") ~= ""
		end,

		keymap = { preset = "enter" },

		appearance = {
			nerd_font_variant = "normal",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer", "avante_commands", "avante_mentions", "avante_files" },

			cmdline = {},

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
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 300,
			},

			ghost_text = {
				enabled = false,
			},
		},
	},
	opts_extend = { "sources.default" },
}
