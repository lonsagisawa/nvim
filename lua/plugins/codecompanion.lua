return {
	"olimorris/codecompanion.nvim",
	version = "^18.0.0",
	opts = {
		interactions = {
			chat = {
				adapter = "codex",
				slash_commands = {
					["file"] = {
						opts = {
							provider = "snacks",
						},
					},
					["buffer"] = {
						opts = {
							provider = "snacks",
						},
					},
					["symbols"] = {
						opts = {
							provider = "snacks",
						},
					},
					["fetch"] = {
						opts = {
							provider = "snacks",
						},
					},
				},
			},
			inline = {
				adapter = "codex",
			},
			cmd = {
				adapter = "codex",
			},
		},
		rules = {
			opts = {
				chat = {
					enabled = false,
				},
			},
		},
		adapters = {
			acp = {
				codex = function()
					return require("codecompanion.adapters").extend("codex", {
						defaults = {
							auth_method = "chatgpt",
						},
					})
				end,
			},
		},
		extensions = {
			spinner = {
				opts = {
					style = "snacks",
				},
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"lalitmee/codecompanion-spinners.nvim",
	},
}
