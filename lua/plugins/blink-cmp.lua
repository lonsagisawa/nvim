local add = MiniDeps.add

add({ source = "saghen/blink.cmp" })

return {
	source = "saghen/blink.cmp",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "enter" },

		appearance = { nerd_font_variant = "normal" },

		snippets = { preset = "default" },

		completion = {
			menu = {
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
								return kind_icon
							end,

							-- (optional) use highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},

						kind = {
							-- (optional) use highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
					},

					columns = {
						{ "kind_icon", "label", "label_description", gap = 1 },
						{ "source_name" },
					},

					treesitter = { "lsp" },
				},
			},

			ghost_text = { enabled = true },

			documentation = {
				auto_show = true,
				window = {
					border = "rounded",
				},
			},
		},

		signature = {
			enabled = true,
			window = {
				border = "rounded",
			},
		},

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "blade-nav", "buffer" },

			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
				["blade-nav"] = {
					module = "blade-nav.blink",
					opts = {
						close_tag_on_complete = false,
					},
				},
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
